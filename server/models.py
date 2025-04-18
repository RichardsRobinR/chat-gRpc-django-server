import mongoengine as me

class UserMetaDataModel(me.Document):
    meta = {'collection': 'snap_usermeta'}


    uid = me.StringField(max_length=128, unique=True, required=True)
    uuid = me.StringField(max_length=6, unique=True, required=True)
    username = me.StringField(max_length=50, unique=True, required=True)
    display_name = me.StringField(max_length=100, required=True)
    profile_image_url = me.URLField(required=False)
    phone_number = me.StringField(max_length=20, required=True)
    bio = me.StringField()

    is_online = me.BooleanField(default=False)
    has_story = me.BooleanField(default=False)
    last_seen = me.LongField(default=0)
    created_at = me.LongField(default=0,required=True)
    last_login = me.LongField(default=0)

    group_id = me.ListField(me.StringField())
    past_uuids = me.ListField(me.StringField())
    blocked_users_id = me.ListField(me.StringField())

    is_verified = me.BooleanField(default=False)
    is_active = me.BooleanField(default=True)
    is_staff = me.BooleanField(default=False)

    def __str__(self):
        return self.username


class MessageModel(me.Document):
    meta = {'collection': 'snap_messages'}

    # id = me.ObjectIdField(primary_key=True)
    # chat_id = me.ReferenceField('ChatMetaDataModel', required=True)  # Reference to the chat
    sender_ref = me.ReferenceField('UserMetaDataModel', required=True)  # Reference to the sender
    recipient_ref = me.ReferenceField('UserMetaDataModel', required=True)  # Reference to the recipient
    content = me.StringField(required=True)
    chat_room_ref = me.ReferenceField('ChatMetaDataModel', required=True)  # Reference to the chat room
    # timestamp = me.DateTimeField(required=True)
    # message_type = me.StringField(max_length=20, required=True)  # e.g., 'text', 'image', 'video'
    status = me.StringField(max_length=20, default='sent')  # e.g., 'sent', 'delivered', 'read'

    def __str__(self):
        return f"Message({str(self.id)})"


class ChatMetaDataModel(me.Document):
    meta = {'collection': 'snap_chat_rooms'}

    # Core fields
    id = me.ObjectIdField(primary_key=True)
    # chat_id = me.StringField(max_length=128, unique=True, required=True)
    # chat_type = me.StringField(max_length=20, required=True)  # e.g., 'individual', 'group'
    
    # participants_uid = me.ListField(me.ReferenceField(''))  # Array of User references
    participants_uid  = me.DictField()  # Dictionary of User references
    last_message = me.StringField(max_length=20,default=None,null=True)  # Reference to the most recent message
    last_message_sender_ref = me.ReferenceField('UserMetaDataModel',default=None,null=True)  # ref of the last message sender
    last_read_time = me.DictField()  # uid -> last read timestamp
    unread_counts = me.MapField(field=me.IntField(),default=None,null=True)  # uid -> count
    chat_request_status = me.StringField(max_length=20,default=None,null=True)  # e.g., 'pending', 'accepted', 'declined'

    # typing_user_ids = me.ListField(me.StringField())  # UIDs of users typing

    chat_source = me.StringField(max_length=20)  # e.g., 'phonenumber'
    initiated_by_phone_number = me.BooleanField(default=False)  # True if the chat was initiated by a phone number
    
    # created_at = me.DateTimeField(required=True)
    # updated_at = me.DateTimeField()
    # last_message = me.ReferenceField('MessageModel')  # Reference to the most recent message

    # Group metadata (only for group chats)
    # group_metadata = me.EmbeddedDocumentField('GroupMetaData', null=True)

    def __str__(self):
        return f"ChatMetaDataModel({str(self.id)})"

class GroupMetaData(me.EmbeddedDocument):
    name = me.StringField(max_length=100)
    description = me.StringField()
    creation_date = me.DateTimeField()
    created_by = me.ReferenceField('UserMetaDataModel')
    admins = me.ListField(me.ReferenceField('UserMetaDataModel'))
    profile_picture = me.StringField()  # URL or file reference


