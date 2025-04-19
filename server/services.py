from .models import UserMetaDataModel, ChatMetaDataModel , MessageModel
import hashlib
from .serializers import UserMetaDataGRPCSerializer , ChatMetaDataGRPCSerializer
import threading
import queue
import grpc
from protos.python import user_service_pb2_grpc , user_service_pb2
from protos.python import chat_service_pb2_grpc , chat_service_pb2
from bson import ObjectId
from .mongo_motor_connection import usermeta_collection , chat_room_collection , messages_collection
from .utils.mongo_utils import get_object_id_from_uid, generate_custom_Uuid
import logging
log = logging.getLogger(__name__)
import time
from .utils import firebase_utils
import asyncio




class UserService(user_service_pb2_grpc.UserServiceServicer):
    
    async def GetUser(self, request, context):
        log.info("GetUser called")

        print("uid", request.uid)
        user = await usermeta_collection.find_one({"uid": request.uid})
        print("USER:", user)

        if not user:
            log.info("User not found")
            await context.abort(grpc.StatusCode.NOT_FOUND, 'User not found')
        
        print("type USER:", type(user))
        user = UserMetaDataModel(**user)
        print("user model:", user)

        user_proto = UserMetaDataGRPCSerializer.to_proto(user)

        print("SERIALIZER DATA ID:", user_proto)

        return user_service_pb2.UserResponse(user=user_proto)
    
    async def CreateUser(self, request, context):
        # uid ,uuid,username , phonenumber ,( profile_picture_url -> optional)
        log.info("CreateUser called")

        auth_metadata = dict(context.invocation_metadata())
        token = auth_metadata.get('authorization')
        firebase_user_metata = None

        if token:
            print(f"Authorization header received: {token}")
            # Optional: Extract actual token part
            if token.startswith("Bearer "):
                jwt_token = token[len("Bearer "):]
                print("Extracted token:", jwt_token)

                firebase_user_metata =  firebase_utils.verify_firebase_auth_token(token=jwt_token)
                if firebase_user_metata.get("success") == False:
                    log.error("Firebase token verification failed")
                    await context.abort(grpc.StatusCode.UNAUTHENTICATED, firebase_user_metata.get("message"))
                
                print("Firebase token verified successfully")
        else:
            await context.abort(grpc.StatusCode.UNAUTHENTICATED, "Missing authorization token")


        if request.uid != firebase_user_metata.get("uid"):
            log.error("UID mismatch")
            await context.abort(grpc.StatusCode.UNAUTHENTICATED, 'UID mismatch')

        try:
            uid = firebase_user_metata.get("uid")
            uuid = generate_custom_Uuid()
            username = firebase_user_metata.get("username") or "@sc-" + str(uid[:6]).lower()
            phone_number = firebase_user_metata.get("phone_number") or None
            display_name = "sc-" + uid[:6]
            
            print("UID:", uid)
            print("UUID:", uuid)
            print("USERNAME:", username)
            print("PHONE NUMBER:", phone_number)
            print("DISPLAY NAME:", display_name)

            if not uid or not uuid or not username or not phone_number:
                log.error("All fields are present")
                await context.abort(grpc.StatusCode.INVALID_ARGUMENT, 'All fields are required')

            if len(uuid) != 6:
                log.error("Invalid UUID length")
                await context.abort(grpc.StatusCode.INVALID_ARGUMENT, 'Invalid UUID length')

            # Check if user already exists
            user = await usermeta_collection.find_one({"uid": uid})
            if not user:
                # context.set_code(grpc.StatusCode.ALREADY_EXISTS)
                # context.set_details('User already exists')
                    # Create new user
                user = UserMetaDataModel(
                    uid=uid,
                    uuid=uuid,
                    username=username,
                    phone_number=phone_number,
                    display_name=display_name,
                    created_at = int(time.time() * 1000),
                )

                user_dict = user.model_dump(by_alias=True)
                result = await usermeta_collection.insert_one(user_dict)
                    
                print("COLLECTION INSERTED RESULT:", result)
                log.info(f"User created successfully: {result.inserted_id}")
            elif user:
                log.info("User already exists")
                user = UserMetaDataModel(**user)
            
            user_proto = UserMetaDataGRPCSerializer.to_proto(user)
            log.info(f"CreatUser completed successfully:")
            return user_service_pb2.UserResponse(user=user_proto)

        except grpc.RpcError as e:
            log.error(f"gRPC Error in CreateUser: {e.code()}: {e.details()}")
            raise
            # context.set_code(grpc.StatusCode.INTERNAL)
            # context.set_details('Internal server error')
            # return user_service_pb2.UserResponse()
            

class ChatService(chat_service_pb2_grpc.ChatServiceServicer):

    def __init__(self):
        self.connected_users = {}  # Maps username to asyncio.Queue
        self.lock = asyncio.Lock()

    async def MessageStream(self, request_iterator, context):
        """Handle bidirectional chat stream with improved error handling"""
        
        try:

            # Get first message to identify sender and initialize queue
            first_message = await request_iterator.__anext__()
            log.info("MessageStream called")
            sender = first_message.sender_ref
            print("SENDER:", sender)
            print("FIRST MESSAGE:", first_message.sender_ref)
            
            async with self.lock:
                if sender not in self.connected_users:
                    my_queue = asyncio.Queue()
                    self.connected_users[sender] = my_queue
                    print(f"User {sender} connected. Total users: {len(self.connected_users)}")
                    # MessageModel.objects.get()
#                     unsent_messages = MessageModel.objects(sender_ref=ObjectId(sender),chat_room_ref=ObjectId(first_message.chat_room_ref))
#                     print("UNSENT MESSAGES:", unsent_messages)

                else:
                    my_queue = self.connected_users[sender]  # Get existing queue

                # Process messages in the background
                processing_task = asyncio.create_task(
                    self._process_messages(first_message, request_iterator, my_queue)
                )


                # Set up cleanup for when client disconnects
                context.add_done_callback(
                    lambda _: asyncio.create_task(self._cleanup(sender, processing_task))
                )


            # Yield messages from queue
            while True:
                try:
                    message =  await my_queue.get()
                    yield message
                except asyncio.CancelledError:
                    break
                except Exception as e:
                    print(f"Error in message stream: {e}")
                    break

        except StopAsyncIteration:
            return
        except Exception as e:
            print(f"Chat stream error: {e}")
            await context.abort(grpc.StatusCode.INTERNAL, str(e))

    async def _cleanup(self, sender, task):
        """Clean up when a client disconnects"""
        task.cancel()
        async with self.lock:
            if sender in self.connected_users:
                del self.connected_users[sender]
                print(f"User {sender} disconnected. Total users: {len(self.connected_users)}")

    async def _process_messages(self, first_message, request_iterator, my_queue):
        """Process incoming messages from a client"""
        try:
            # Process first message
            await self._route_message(first_message, my_queue)
            # Process remaining messages
            async for message in request_iterator:
                await self._route_message(message, my_queue)
        except asyncio.CancelledError:
            # Expected when client disconnects
            pass
        except Exception as e:
            print(f"Error processing messages: {e}")
    

    async def _route_message(self, message, sender_queue):
        """Route message to recipient or send error if offline"""
        if message.content == "__join__":
            return  # Don't forward join messages
        
        if message.content == "__leave__":
            return  # Handled by _cleanup

        async with self.lock:
            recipient_ref = message.recipient_ref

            # acknowledge message to the sender
            # if message.sender_ref in self.connected_users:
#             #     aacknowledge_message = chat_service_pb2.Message(
#             #         sender="SERVER",
#             #         content="SENT",
#             #         recipient=message.sender_ref,
#             #     )
#             #  await    sender_queue.put(aacknowledge_message)


           
            if recipient_ref in self.connected_users:
                self.connected_users[recipient_ref].put(message)
                
#                 # sender = UserMetaDataModel.objects.get(id=ObjectId(message.sender))
#                 # recipient = UserMetaDataModel.objects.get(id=ObjectId(recipient))
#                 # print("SENDER:", sender)
#                 # print("RECIPIENT:", recipient)
#                 # chat_source_value = request.chat_source
#                 # chat_source_enum_name = chat_service_pb2.MessageStatus.

                msg = await self._db_send_message(message, recipient_ref, status="DELIVERED")

#                 # acknowledge message to the sender
                
                
            else:
#                 # sender = UserMetaDataModel.objects.get(id=ObjectId(message.sender))
#                 # recipient = UserMetaDataModel.objects.get(id=ObjectId(recipient))
#                 # print("SENDER:", sender)
#                 # print("RECIPIENT:", recipient)

                await self._db_send_message(message, recipient_ref, status="SENT")

#                 # error_msg = chat_service_pb2.Message(
#                 #     message_id="0",
#                 #     sender="Server",
#                 #     content=f"User {recipient} is offline.",
#                 #     recipient=message.sender
#                 # )
#                 # sender_queue.put(error_msg)


    async def _db_send_message(self,message, recipient, status):
        """Save message to database asynchronously using Motor"""

        try:

#             # chat_room_ref = ChatMetaDataModel.objects(id=ObjectId(message.chat_room_ref)).first()
            msg =  MessageModel(sender_ref = ObjectId(message.sender_ref), recipient_ref = ObjectId(recipient), 
                content=message.content,
                status=status,
                chat_room_ref = ObjectId(message.chat_room_ref),

            )
            # Convert to dictionary before inserting
            msg_dict = msg.model_dump(by_alias=True)
            result = await messages_collection.insert_one(msg_dict)
            print("Message saved with ID:", result)

            # Update chat room
            update_result = await chat_room_collection.update_one(
                {'_id': ObjectId(message.chat_room_ref)},
                {'$set': {
                    'last_message': message.content,
                    'last_message_sender_ref': ObjectId(message.sender_ref),
                    f'last_read_time.{message.sender_ref}': int(time.time() * 1000)
                }}
            )

             


            

#             # msg.chat_room_ref.last_message = message.content
#             # msg.chat_room_ref.last_message_sender_ref = message.sender_ref
#             # msg.chat_room_ref.last_read_time[recipient] = int(time.time() * 1000)
#             # TODO: leave me alone
#             chat = msg.chat_room_ref.update(
#                 set__last_message=message.content,
#                 set__last_message_sender_ref= ObjectId(message.sender_ref),
#                 set__last_read_time={str(message.sender_ref): int(time.time() * 1000)},
#             )

#             # chat = ChatMetaDataModel.objects.get(id=ObjectId(message.chat_room_ref))

#             # chat.last_message = msg.content

#             # chat.save()
            
            print(f"Chat room updated, matched: {update_result.matched_count}")
            return result.inserted_id
        except Exception as e:
            print("Failed to save message:", e)

    
    async def ChatRoom(self, request, context):
        log.info("ChatRoom called")
        try:
            current_user_uid = request.current_user_uid
            other_user_uid = request.other_user_uid
            current_user_phone_number = request.current_user_phone_number
            chat_source_value = request.chat_source
            chat_source_enum_name = chat_service_pb2.ChatSource.Name(chat_source_value)
            print(f"CURRENT USER UID: {current_user_uid}")
            print("OTHER USER UID:", other_user_uid)
            print("CURRENT USER PHONE NUMBER:", current_user_phone_number)
            print("CHAT SOURCE:", chat_source_value)
            print("CHAT SOURCE ENUM:", chat_source_enum_name)

            log.debug("Harmless debug Message")
            log.info("Info Message")

            if not current_user_uid or not other_user_uid:
                # context.set_code(grpc.StatusCode.INVALID_ARGUMENT)
                # context.set_details('User IDs are required')
                await context.abort(grpc.StatusCode.INVALID_ARGUMENT, 'User IDs are required')

            if current_user_uid == other_user_uid:
                await context.abort(grpc.StatusCode.INVALID_ARGUMENT, 'Cannot chat with yourself')
            
            if not current_user_phone_number:
                await context.abort(grpc.StatusCode.INVALID_ARGUMENT, 'Phone number is required')


            
            current_user_object_id = await get_object_id_from_uid(current_user_uid, usermeta_collection)
            other_user_object_id = await get_object_id_from_uid(other_user_uid, usermeta_collection)
            print("CURRENT USER objectid:", current_user_object_id)
            print("OTHER USER objectid:", other_user_object_id)


            sorted_participants_uids = sorted([current_user_uid, other_user_uid])
            # sorted_user_object_id = sorted([current_user_object_id, other_user_object_id])

            room_id = f"{sorted_participants_uids[0]}_{sorted_participants_uids[1]}"
            print("ROOM ID:", room_id)

            if isinstance(room_id, str):
                data = room_id.encode()
                sha256_hash = hashlib.sha256(data).hexdigest()
                print("SHA256 Hash:", sha256_hash)
                room_id = sha256_hash[:24]
            else:
                await context.abort(grpc.StatusCode.INVALID_ARGUMENT, 'Hashing failed')
            
            print("Hashed ROOM ID:", room_id)

            # Check if chat room already exists
            chat_room_data = await chat_room_collection.find_one({"_id": ObjectId(room_id)})
            print("CHAT ROOM data:", chat_room_data)
            print("CHAT ROOM TYPE:", type(chat_room_data))
            if chat_room_data:
                print("Chat room already exists:", chat_room_data)
                chat_room = ChatMetaDataModel(**chat_room_data)
            else:
                chat_room = ChatMetaDataModel(
                    id= ObjectId(room_id),
                    participants_uid= {current_user_uid : current_user_object_id, other_user_uid: other_user_object_id},
                    chat_source=  chat_source_enum_name ,
                    initiated_by_phone_number=  True if  chat_source_enum_name == "PHONE_NUMBER" else False,
                    # last_message="",
                    # last_message_sender_ref=None,
                    # last_read_time={current_user_uid: int(time.time() * 1000)},
                    # unread_counts={current_user_uid: 0, other_user_uid: 0},
                    # chat_request_status= "PENDING",
                )
                chat_room_dict = chat_room.model_dump(by_alias=True)
                result = await chat_room_collection.insert_one(chat_room_dict)
                print("COLLECTION INSERTED RESULT:", result)
                print("chat room id",result.inserted_id)
                # print("Chat room created:", result)

            # print("type chat romm:", type(result))

           
            print("last message", chat_room.last_message)
            
            # Convert to protobuf message
            chat_proto = ChatMetaDataGRPCSerializer.to_proto(chat_room)
            print("Chat room protobuf:", chat_proto)
            return chat_service_pb2.ChatResponse(chat=chat_proto)
        except grpc.RpcError as e:
            print(f"Error in ChatRoom: {e}")
            context.set_code(grpc.StatusCode.INTERNAL)
            context.set_details('Internal server error')
            # return chat_service_pb2.ChatResponse()
            raise
        
    
    async def VerifyUuid(self, request, context):
        log.info("VerifyUuid called")
        try:
            uuid = request.uuid
            print("UUID:", uuid)
            if len(uuid) != 6:
                # context.set_code(grpc.StatusCode.INVALID_ARGUMENT)
                # context.set_details('Invalid UUID length')
                log.error("Invalid UUID length")
                await context.abort(grpc.StatusCode.INVALID_ARGUMENT, 'Invalid UUID length')

            user = await usermeta_collection.find_one({"uuid": request.uuid})
            print("USER:", user)
            
            if user == None:
                log.info("User not found")
                await context.abort(grpc.StatusCode.NOT_FOUND, 'User not found')

            user = UserMetaDataModel(**user)
            user_proto = UserMetaDataGRPCSerializer.to_proto(user)

            log.info("VerifyUuid finished")
            return chat_service_pb2.VerifyUuidResponse(user=user_proto)
        except grpc.RpcError as e:  
            print(f"Error in VerifyUuid: {e}")
            log.error(f"gRPC Error in VerifyUuid: {e.code()}: {e.details()}")
            raise
            # return chat_service_pb2.VerifyUuidResponse(user=None)
       

            
            


    

