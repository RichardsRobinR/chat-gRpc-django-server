from bson import ObjectId
from .models import UserMetaDataModel ,MessageModel, ChatMetaDataModel, MessageModelEmbedded
from protos.python import user_metadata_pb2 
from protos.python import chat_metadata_pb2


class UserMetaDataGRPCSerializer:
    @staticmethod
    def to_proto(user: UserMetaDataModel):
        # Convert model instance to dict
        data = {
            "id": str(user.id),
            "uid": user.uid,
            "uuid": user.uuid,
            "username": user.username,
            "display_name": user.display_name,
            "profile_image_url": user.profile_image_url,
            "phone_number": user.phone_number,
            "bio": user.bio,
            "is_online": user.is_online,
            "has_story": user.has_story,
            "last_seen": user.last_seen,
            "created_at": user.created_at,
            "last_login": user.last_login,
            "group_id": [str(x) for x in user.group_id or []],
            "past_uuids": [str(x) for x in user.past_uuids or []],
            "blocked_users_id": [str(x) for x in user.blocked_users_id or []],
            "is_verified": user.is_verified,
            "is_active": user.is_active,
            "is_staff": user.is_staff,
        }
        return user_metadata_pb2.User(**data)


class MessageGRPCSerializer:
    @staticmethod
    def to_proto(msg: MessageModel):
        data = {
            "id": str(msg.id) ,
            "sender_ref": str(msg.sender_ref),
            "recipient_ref": str(msg.recipient_ref),
            "content": msg.content,
            "chat_room_ref": str(msg.chat_room_ref),
            "status": msg.status,
        }
        return chat_metadata_pb2.Message(**data)
    

class MessageEmbeddedGRPCSerializer:
    @staticmethod
    def to_proto(msg: MessageModelEmbedded):
        data = {
            "sender_ref": str(msg.sender_ref),
            "recipient_ref": str(msg.recipient_ref),
            "content": msg.content,
            "chat_room_ref": str(msg.chat_room_ref),
            "status": msg.status,
        }
        return chat_metadata_pb2.Message(**data)
    

class ChatMetaDataGRPCSerializer:
    @staticmethod
    def to_proto(chat: ChatMetaDataModel):
        data = {
            "id": str(chat.id),
            "participants_uid": {key : str(value) for key,value in (chat.participants_uid or {}).items()},
            "last_message": MessageEmbeddedGRPCSerializer.to_proto(chat.last_message) if chat.last_message else None,
            "chat_source": chat.chat_source,
            "initiated_by_phone_number": chat.initiated_by_phone_number,
        }
        return chat_metadata_pb2.Chat(**data)

#  {key: str(user.id) for key, user in participants_uid.items()}