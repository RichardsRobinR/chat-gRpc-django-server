from pydantic import BaseModel, Field, HttpUrl ,ConfigDict
from pydantic_core import core_schema
from typing import Dict, Optional, Any, List 
from bson import ObjectId

class PyObjectId(ObjectId):
    @classmethod
    def __get_pydantic_core_schema__(cls, _source_type, _handler):
        def validate_from_str(value: str) -> ObjectId:
            if ObjectId.is_valid(value):
                return cls(value)
            raise ValueError(f"Invalid ObjectId: {value}")

        return core_schema.union_schema(
            [
                # Check if it's an instance first
                core_schema.is_instance_schema(ObjectId),
                # Then check if it's a string and can be converted
                core_schema.no_info_plain_validator_function(validate_from_str),
            ],
            serialization=core_schema.to_string_ser_schema(),
        )

class UserMetaDataModel(BaseModel):
    id: Optional[PyObjectId] = Field(default_factory=PyObjectId, alias="_id")
    uid: str = Field(...)
    uuid: str = Field(...)
    username: str = Field(...)
    display_name: str = Field(...)
    profile_image_url: Optional[HttpUrl] = None
    phone_number: str
    bio: Optional[str] = None
    
    is_online: bool = False
    has_story: bool = False
    last_seen: int = 0
    created_at: int
    last_login: int = 0
    
    group_id: List[str] = []
    past_uuids: List[str] = []
    blocked_users_id: List[str] = []
    
    is_verified: bool = False
    is_active: bool = True
    is_staff: bool = False
    
    model_config = ConfigDict(
        arbitrary_types_allowed=True,
        populate_by_name=True,
    )



class MessageModel(BaseModel):
    id: Optional[PyObjectId] = Field(default_factory=PyObjectId, alias="_id")
    sender_ref: PyObjectId = Field(...)
    recipient_ref: PyObjectId = Field(...)
    content: str
    chat_room_ref: PyObjectId = Field(...)
    status: str = "sent"
    
    model_config = ConfigDict(
        arbitrary_types_allowed=True,
        populate_by_name=True,
    )

class ChatMetaDataModel(BaseModel):
    id: Optional[PyObjectId] = Field(default_factory=PyObjectId, alias="_id") 
    participants_uid: Dict[str, Any] = {}
    last_message: Optional[str] = None
    last_message_sender_ref: Optional[PyObjectId] = None
    last_read_time: Dict[str, int] = {}
    unread_counts: Dict[str, int] = {}
    chat_request_status: Optional[str] = None
    chat_source: str
    initiated_by_phone_number: bool = False
    
    class Config:
        validate_by_name = True
        arbitrary_types_allowed = True
