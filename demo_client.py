import grpc
from protos.python import user_service_pb2 ,user_service_pb2_grpc

with grpc.insecure_channel('localhost:50051') as channel:
    stub = user_service_pb2_grpc.UserServiceStub(channel)
    response = stub.GetUser(user_service_pb2.UserRequest(uid="test_uid_001"))
    print(type(response))