from motor.motor_asyncio import AsyncIOMotorClient

MONGO_URI = "mongodb+srv://richierichr:1210@awscluster.eobbnxt.mongodb.net/?retryWrites=true&w=majority&appName=AWSCluster"
client = AsyncIOMotorClient(MONGO_URI)
        
# Store the client on the AppConfig for access elsewhere
client = client
db = client["connect_db"]


# Define the collections for each model
usermeta_collection = db["snap_usermeta"]
messages_collection = db["snap_messages"]
chat_room_collection = db["snap_chat_rooms"]
