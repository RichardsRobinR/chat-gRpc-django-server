import random
import string


async def get_uuid_from_uid(uid, usermeta_collection):
    """Fetches the UUID from MongoDB using the given UID.
    """
    try:
        user_doc = await usermeta_collection.find_one({"uid": uid})
    except (Exception) as e:
        print("Error fetching user document:", e)
        return None
    
    if user_doc:
        # When using motor , you access document fields as dictionary keys
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


async def get_object_id_from_uid(uid,usermeta_collection):
    """
    Fetches the objectid from MongoDB using the given UID.
    """
    try:
        user_doc = await usermeta_collection.find_one({"uid": uid})
    except (Exception) as e:
        print("Error fetching user document:", e)
        return None
    
    if user_doc:
        # When using motor , you access document fields as dictionary keys
        return user_doc["_id"]
    
    return None  # Return None if no match is found