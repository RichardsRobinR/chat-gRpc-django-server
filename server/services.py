from .models import UserMetaDataModel, ChatMetaDataModel
import hashlib
from .serializers import UserMetaDataGRPCSerializer , ChatMetaDataGRPCSerializer
import threading
import queue
import grpc
from protos.python import user_service_pb2_grpc , user_service_pb2
from protos.python import chat_service_pb2_grpc , chat_service_pb2
from bson import ObjectId
from .mongo_motor_connection import usermeta_collection , chat_room_collection
from .utils.mongo_utils import get_object_id_from_uid
import logging
log = logging.getLogger(__name__)
import time




class UserService(user_service_pb2_grpc.UserServiceServicer):
    
    async def GetUser(self, request, context):
        log.info("GetUser called")

       
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

        if token:
            print(f"Authorization header received: {token}")
            # Optional: Extract actual token part
            if token.startswith("Bearer "):
                jwt_token = token[len("Bearer "):]
                print("Extracted token:", jwt_token)
        else:
            await context.abort(grpc.StatusCode.UNAUTHENTICATED, "Missing authorization token")


        try:
            uid = request.user.uid or None
            uuid = request.user.uuid or None
            username = request.user.username or None
            phone_number = request.user.phone_number or None
            profile_image_url = request.user.profile_image_url or None
            
            
            # Generate the display name
            display_name = "sc-" + username
            print("DISPLAY NAME:", display_name)

            
            print("UID:", uid)
            print("UUID:", uuid)
            print("USERNAME:", username)
            print("PHONE NUMBER:", phone_number)
            print("PROFILE IMAGE URL:", profile_image_url)


            if not uid or not uuid or not username or not phone_number:
                log.error("All fields are present")
                await context.abort(grpc.StatusCode.INVALID_ARGUMENT, 'All fields are required')

            if len(uuid) != 6:
                log.error("Invalid UUID length")
                await context.abort(grpc.StatusCode.INVALID_ARGUMENT, 'Invalid UUID length')

            # Check if user already exists
            existing_user = await usermeta_collection.find_one({"uid": uid})
            print("EXISTING USER:", existing_user)
            if existing_user:
                # context.set_code(grpc.StatusCode.ALREADY_EXISTS)
                # context.set_details('User already exists')
                log.error("User already exists")
                await context.abort(grpc.StatusCode.ALREADY_EXISTS, 'User already exists')


            profile_image_url = request.User.profile_image_url if request.user.profile_image_url else None
            log.info(f"Profile image URL: {profile_image_url}")

            # Create new user
            new_user = UserMetaDataModel(
                uid=uid,
                uuid=uuid,
                username=username,
                phone_number=phone_number,
                display_name=display_name,
                profile_image_url=profile_image_url,
                created_at = int(time.time() * 1000),
            )

            new_user_dict = new_user.model_dump(by_alias=True)
            result = await usermeta_collection.insert_one(new_user_dict)
                
            print("COLLECTION INSERTED RESULT:", result)
            log.info(f"User created successfully: {result.inserted_id}")

            user_proto = UserMetaDataGRPCSerializer.to_proto(new_user)
            log.info(f"CreatUser completed successfully:")
            return user_service_pb2.UserResponse(user=user_proto)

        except grpc.RpcError as e:
            log.error(f"gRPC Error in CreateUser: {e.code()}: {e.details()}")
            raise
            # context.set_code(grpc.StatusCode.INTERNAL)
            # context.set_details('Internal server error')
            # return user_service_pb2.UserResponse()
            

class ChatService(chat_service_pb2_grpc.ChatServiceServicer):

#     def __init__(self):
#         self.connected_users = {}  # Maps username to queue 
#         self.lock = threading.Lock()

#     def MessageStream(self, request_iterator, context):
#         """Handle bidirectional chat stream with improved error handling"""
        
#         try:

#             # Get first message to identify sender and initialize queue
#             first_message = next(request_iterator)
#             log.info("MessageStream called")
#             sender = first_message.sender_ref
#             print("SENDER:", sender)
#             print("FIRST MESSAGE:", first_message.sender_ref)
            
#             with self.lock:
#                 if sender not in self.connected_users:
#                     my_queue = queue.Queue()
#                     self.connected_users[sender] = my_queue
#                     print(f"User {sender} connected. Total users: {len(self.connected_users)}")
#                     # MessageModel.objects.get()
#                     unsent_messages = MessageModel.objects(sender_ref=ObjectId(sender),chat_room_ref=ObjectId(first_message.chat_room_ref))
#                     print("UNSENT MESSAGES:", unsent_messages)

#                 else:
#                     my_queue = self.connected_users[sender]  # Get existing queue

#             # Start message processing thread
#             def process_messages():
#                 try:

#                     print("first_message", first_message)
#                     # Process first message
#                     self._route_message(first_message, my_queue)
#                     # Process remaining messages
#                     for message in request_iterator:
#                         self._route_message(message, my_queue)
#                 except Exception as e:
#                     print(f"Error processing messages: {e}")

#             if threading.main_thread().is_alive():
#                 message_thread = threading.Thread(target=process_messages, daemon=True)
#                 message_thread.start()

#             # Yield messages from queue
#             while True:
#                 try:
#                     message = my_queue.get()
#                     yield message
#                 except Exception as e:
#                     print(f"Error in message stream: {e}")
#                     break

#         except StopIteration:
#             return
#         except Exception as e:
#             print(f"Chat stream error: {e}")
#             context.abort(grpc.StatusCode.INTERNAL, str(e))

#     def _route_message(self, message, sender_queue):
#         """Route message to recipient or send error if offline"""
#         if message.content == "__join__":
#             return  # Don't forward join messages
        
#         if message.content == "__leave__":
#             del self.connected_users[message.sender_ref]
#             print(f"User {message.sender} disconnected. Total users: {len(self.connected_users)}")
#             return  # Don't forward leave messages

#         with self.lock:
#             recipient_ref = message.recipient_ref

#             # acknowledge message to the sender
#             # if message.sender_ref in self.connected_users:
#             #     aacknowledge_message = chat_service_pb2.Message(
#             #         sender="SERVER",
#             #         content="SENT",
#             #         recipient=message.sender_ref,
#             #     )
#             #     sender_queue.put(aacknowledge_message)


           
#             if recipient_ref in self.connected_users:
#                 self.connected_users[recipient_ref].put(message)
                
#                 # sender = UserMetaDataModel.objects.get(id=ObjectId(message.sender))
#                 # recipient = UserMetaDataModel.objects.get(id=ObjectId(recipient))
#                 # print("SENDER:", sender)
#                 # print("RECIPIENT:", recipient)
#                 # chat_source_value = request.chat_source
#                 # chat_source_enum_name = chat_service_pb2.MessageStatus.

#                 msg = self._db_send_message(message, recipient_ref, status="DELIVERED")

#                 # acknowledge message to the sender
                
                
#             else:
#                 # sender = UserMetaDataModel.objects.get(id=ObjectId(message.sender))
#                 # recipient = UserMetaDataModel.objects.get(id=ObjectId(recipient))
#                 # print("SENDER:", sender)
#                 # print("RECIPIENT:", recipient)

#                 self._db_send_message(message, recipient_ref, status="SENT")

#                 # error_msg = chat_service_pb2.Message(
#                 #     message_id="0",
#                 #     sender="Server",
#                 #     content=f"User {recipient} is offline.",
#                 #     recipient=message.sender
#                 # )
#                 # sender_queue.put(error_msg)


#     def _db_send_message(self,message, recipient, status):
#         """Save message to database"""

#         try:

#             # chat_room_ref = ChatMetaDataModel.objects(id=ObjectId(message.chat_room_ref)).first()
#             msg =  MessageModel(sender_ref = ObjectId(message.sender_ref), recipient_ref = ObjectId(recipient), 
#                 content=message.content,
#                 status=status,
#                 chat_room_ref = ObjectId(message.chat_room_ref),
#             ).save()
#             print("Message saved:", msg)


            

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
            
#             print("Chat room updated:", chat)
#             return msg
#         except (ValidationError, NotUniqueError) as e:
#             print("Failed to save message:", e)

    
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
        
    
#     def VerifyUuid(self, request, context):
#         log.info("VerifyUuid called")
#         try:
#             uuid = request.uuid
#             print("UUID:", uuid)
#             if len(uuid) != 6:
#                 # context.set_code(grpc.StatusCode.INVALID_ARGUMENT)
#                 # context.set_details('Invalid UUID length')
#                 log.error("Invalid UUID length")
#                 context.abort(grpc.StatusCode.INVALID_ARGUMENT, 'Invalid UUID length')

#             user = UserMetaDataModel.objects(uuid=uuid).first()
#             print("USER:", user)
            
#             if user == None:
#                 log.info("User not found")
#                 context.abort(grpc.StatusCode.NOT_FOUND, 'User not found')

#             user_proto = UserMetaDataGRPCSerializer.to_proto(user)

#             log.info("VerifyUuid finished")
#             return chat_service_pb2.VerifyUuidResponse(user=user_proto)
#         except grpc.RpcError as e:  
#             print(f"Error in VerifyUuid: {e}")
#             log.error(f"gRPC Error in VerifyUuid: {e.code()}: {e.details()}")
#             raise
#             # return chat_service_pb2.VerifyUuidResponse(user=None)
       

            
            


    

