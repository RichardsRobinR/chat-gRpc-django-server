from .models import UserMetaDataModel , MessageModel ,ChatMetaDataModel , GroupMetaData

from .serializers import UserMetaDataGRPCSerializer
import threading
import queue
import grpc
from protos.python import user_metadata_pb2_grpc , user_metadata_pb2
from protos.python import chat_metadata_pb2_grpc , chat_metadata_pb2
from bson import ObjectId
from mongoengine import ValidationError, NotUniqueError




class UserService(user_metadata_pb2_grpc.UserServiceServicer):
    def GetUser(self, request, context):
        try:
            user = UserMetaDataModel.objects.get(uid=request.uid)
            print("USER:", user)
        except UserMetaDataModel.DoesNotExist:
            context.set_code(5)  # NOT_FOUND
            context.set_details('User not found')
            return user_metadata_pb2.UserResponse()
        
        print("omggg")

        user_proto = UserMetaDataGRPCSerializer.to_proto(user)

        print("SERIALIZER DATA:", user_proto)
        print("okokokk")
        return user_metadata_pb2.UserResponse(user=user_proto)
    

class ChatService(chat_metadata_pb2_grpc.ChatServiceServicer):

    def __init__(self):
        self.connected_users = {}  # Maps username to queue 
        self.lock = threading.Lock()

    def MessageStream(self, request_iterator, context):
        """Handle bidirectional chat stream with improved error handling"""
        try:
            # Get first message to identify sender and initialize queue
            first_message = next(request_iterator)
            sender = first_message.sender
            
            with self.lock:
                if sender not in self.connected_users:
                    my_queue = queue.Queue()
                    self.connected_users[sender] = my_queue
                    print(f"User {sender} connected. Total users: {len(self.connected_users)}")
                else:
                    my_queue = self.connected_users[sender]

            # Start message processing thread
            def process_messages():
                try:

                    print("first_message", first_message)
                    # Process first message
                    self._route_message(first_message, my_queue)
                    # Process remaining messages
                    for message in request_iterator:
                        self._route_message(message, my_queue)
                except Exception as e:
                    print(f"Error processing messages: {e}")

            message_thread = threading.Thread(target=process_messages, daemon=True)
            message_thread.start()

            # Yield messages from queue
            while True:
                try:
                    message = my_queue.get()
                    yield message
                except Exception as e:
                    print(f"Error in message stream: {e}")
                    break

        except StopIteration:
            return
        except Exception as e:
            print(f"Chat stream error: {e}")
            context.abort(grpc.StatusCode.INTERNAL, str(e))

    def _route_message(self, message, sender_queue):
        """Route message to recipient or send error if offline"""
        if message.content == "__join__":
            return  # Don't forward join messages
        with self.lock:
            recipient = message.recipient
           
            if recipient in self.connected_users:
                self.connected_users[recipient].put(message)

                  
                
                # sender = UserMetaDataModel.objects.get(id=ObjectId(message.sender))
                # recipient = UserMetaDataModel.objects.get(id=ObjectId(recipient))
                # print("SENDER:", sender)
                # print("RECIPIENT:", recipient)


                
                MessageModel(sender = ObjectId(message.sender), recipient = ObjectId(recipient), 
                                content = message.content,
                                status = "DELIVERED").save()
                

                
                
            else:
                # sender = UserMetaDataModel.objects.get(id=ObjectId(message.sender))
                # recipient = UserMetaDataModel.objects.get(id=ObjectId(recipient))
                # print("SENDER:", sender)
                # print("RECIPIENT:", recipient)
                
                try:
                    msg =  MessageModel(sender = ObjectId(message.sender), recipient = ObjectId(recipient), 
                        content=message.content,
                        status="SENT"
                    ).save()
                    print("Message saved with ID:", msg.id)

                except (ValidationError, NotUniqueError) as e:
                    print("Failed to save message:", e)


                # error_msg = chat_metadata_pb2.Message(
                #     message_id="0",
                #     sender="Server",
                #     content=f"User {recipient} is offline.",
                #     recipient=message.sender
                # )
                # sender_queue.put(error_msg)


        
    

