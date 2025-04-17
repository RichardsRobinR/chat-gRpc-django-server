import random
import string
from server.models import UserMetaDataModel
from bson import ObjectId
from mongoengine import ValidationError, NotUniqueError


def get_uuid_from_uid(uid):
    """
    Fetches the UUID from MongoDB using the given UID.
    
    Args:
        uid (str): The UID to search for.
    
    Returns:
        str | None: The UUID if found, else None.
    """
    try:
        user_doc = UserMetaDataModel.objects(uid=uid).first()
    except (Exception) as e:
        print("Error fetching user document:", e)
        return None
    
    if user_doc:
        # When using MongoEngine, you access document fields as attributes, not via get()
        return user_doc.uuid
    
    return None  # Return None if no match is found

def generate_custom_Uuid():
        """Generates a 6-character UUID with 3 letters and 3 digits in random order."""
        characters = (
                random.choices(string.ascii_uppercase, k=3) +
                random.choices(string.digits, k=3) 
        )
        random.shuffle(characters)  # Shuffle the list
        return ''.join(characters)  # Convert back to a string


def get_object_id_from_uid(uid):
    """
    Fetches the objectid from MongoDB using the given UID.
    
    Args:
        uid (str): The UID to search for.
    
    Returns:
        str | None: The objectid if found, else None.
    """
    try:
        user_doc = UserMetaDataModel.objects(uid=uid).first()
    except (Exception) as e:
        print("Error fetching user document:", e)
        return None
    
    if user_doc:
        # When using MongoEngine, you access document fields as attributes, not via get()
        return user_doc.id
    
    return None  # Return None if no match is found