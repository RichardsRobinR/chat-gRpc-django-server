from bson import ObjectId
from .models import UserMetaDataModel
from protos.python import user_metadata_pb2 

def convert_objectid(data):
    if isinstance(data, ObjectId):
        return str(data)
    elif isinstance(data, list):
        return [convert_objectid(item) for item in data]
    elif isinstance(data, dict):
        return {k: convert_objectid(v) for k, v in data.items()}
    return data

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
