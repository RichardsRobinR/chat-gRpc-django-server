import mongoengine as me

class UserMetaDataModel(me.Document):
    meta = {'collection': 'snap_usermeta'}

    uid = me.StringField(max_length=128, unique=True, required=True)
    uuid = me.StringField(max_length=6, unique=True, required=True)
    username = me.StringField(max_length=50, unique=True, required=True)
    display_name = me.StringField(max_length=100, required=True)
    profile_image_url = me.URLField()
    phone_number = me.StringField(max_length=20, required=True)
    bio = me.StringField()

    is_online = me.BooleanField(default=False)
    has_story = me.BooleanField(default=False)
    last_seen = me.LongField(default=0)
    created_at = me.LongField(default=0)
    last_login = me.LongField(default=0)

    group_id = me.ListField(me.StringField())
    past_uuids = me.ListField(me.StringField())
    blocked_users_id = me.ListField(me.StringField())

    is_verified = me.BooleanField(default=False)
    is_active = me.BooleanField(default=True)
    is_staff = me.BooleanField(default=False)

    def __str__(self):
        return self.username
    

class ChatMetaDataModel(me.Document):
    meta = {'collection': 'snap_chatmeta'}

    # Core fields
    chat_id = me.StringField(max_length=128, unique=True, required=True)
    chat_type = me.StringField(max_length=20, required=True)  # e.g., 'individual', 'group'
    participants = me.ListField(me.ReferenceField('UserMetaDataModel'))  # Array of User references
    created_at = me.DateTimeField(required=True)
    updated_at = me.DateTimeField()
    # last_message = me.ReferenceField('MessageModel')  # Reference to the most recent message

    # Group metadata (only for group chats)
    group_metadata = me.EmbeddedDocumentField('GroupMetaData', null=True)

    def __str__(self):
        return self.chat_id

class GroupMetaData(me.EmbeddedDocument):
    name = me.StringField(max_length=100)
    description = me.StringField()
    creation_date = me.DateTimeField()
    created_by = me.ReferenceField('UserMetaDataModel')
    admins = me.ListField(me.ReferenceField('UserMetaDataModel'))
    profile_picture = me.StringField()  # URL or file reference