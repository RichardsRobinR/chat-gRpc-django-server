import firebase_admin
from firebase_admin import credentials , auth
import logging
log = logging.getLogger(__name__)
import os
from django.conf import settings

firebase_cert_path = os.path.join(settings.BASE_DIR, 'firebase-adminsdk-service-account.json')
 
def initialize_firebase():
    """
    Initialize Firebase Admin SDK with default credentials.
    This function initializes the Firebase Admin SDK using the default credentials
    and returns the default app instance.
    """
    # Initialize the Firebase Admin SDK with default credentials
    # This will look for the GOOGLE_APPLICATION_CREDENTIALS environment variable       

    if not firebase_admin._apps:
        # Initialize Firebase only if not already initialized
        # This prevents re-initialization in case of multiple imports
        cred = credentials.Certificate(firebase_cert_path)
        default_app = firebase_admin.initialize_app(credential=cred)
    #     return default_app
    # else:
    #     # If already initialized, return the default app
    #     return firebase_admin.get_app()

def verify_firebase_auth_token(token: str, required_role=None):
    """
    Verify Firebase authentication token and return user UID.

    - If `required_role` is provided, verifies that the user has the specified role.
    - Handles different Firebase authentication errors gracefully.

    Args:
        token (str): Firebase ID token.
        required_role (str, optional): Role required for authentication.

    Returns:
        dict: A dictionary with 'success', 'uid', and 'message' keys.
    """
    try:
        decoded_token = auth.verify_id_token(token)
        print(decoded_token)
        uid = decoded_token.get("uid")
        phone_number = decoded_token.get("phone_number")
        user_name = decoded_token.get("")
        email_verified = decoded_token.get("email_verified", False)
        claims = decoded_token.get("custom_claims", {})

        if not uid:
            return {"success": False, "message": "Invalid token: UID not found."}

        # Check email verification status (if required)
        # if not email_verified:
        #     return {"success": False, "message": "Email is not verified."}

        # Check role-based access if required
        if required_role:
            user_role = claims.get("role")
            if user_role != required_role:
                return {"success": False, "message": f"Insufficient permissions. Required role: {required_role}"}

        return {"success": True, "uid": uid, "phone_number": phone_number,
                "message": "Auth token verified successfully."}

    except auth.ExpiredIdTokenError:
        return {"success": False, "message": "Token has expired."}
    except auth.RevokedIdTokenError:
        return {"success": False, "message": "Token has been revoked."}
    except auth.InvalidIdTokenError:
        return {"success": False, "message": "Invalid token format."}
    except auth.UserDisabledError:
        return {"success": False, "message": "Your account has been disabled."}
    except Exception as e:
        log.error(f"Error verifying Firebase token: {str(e)}")
        return {"success": False, "message": f"Failed to verify token: {str(e)}"}



