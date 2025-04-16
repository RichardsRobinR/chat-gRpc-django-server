//
//  Generated code. Do not modify.
//  source: user_metadata.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user_metadata.pb.dart' as $0;

export 'user_metadata.pb.dart';

@$pb.GrpcServiceName('connect.UserService')
class UserServiceClient extends $grpc.Client {
  static final _$getUser = $grpc.ClientMethod<$0.UserRequest, $0.UserResponse>(
      '/connect.UserService/GetUser',
      ($0.UserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserResponse.fromBuffer(value));
  static final _$createUser = $grpc.ClientMethod<$0.CreateUserRequest, $0.UserResponse>(
      '/connect.UserService/CreateUser',
      ($0.CreateUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserResponse.fromBuffer(value));
  static final _$listUsers = $grpc.ClientMethod<$0.Empty, $0.UserResponse>(
      '/connect.UserService/ListUsers',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserResponse.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.UserResponse> getUser($0.UserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserResponse> createUser($0.CreateUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createUser, request, options: options);
  }

  $grpc.ResponseStream<$0.UserResponse> listUsers($0.Empty request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$listUsers, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('connect.UserService')
abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'connect.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UserRequest, $0.UserResponse>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserRequest.fromBuffer(value),
        ($0.UserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateUserRequest, $0.UserResponse>(
        'CreateUser',
        createUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateUserRequest.fromBuffer(value),
        ($0.UserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.UserResponse>(
        'ListUsers',
        listUsers_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.UserResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.UserResponse> getUser_Pre($grpc.ServiceCall $call, $async.Future<$0.UserRequest> $request) async {
    return getUser($call, await $request);
  }

  $async.Future<$0.UserResponse> createUser_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateUserRequest> $request) async {
    return createUser($call, await $request);
  }

  $async.Stream<$0.UserResponse> listUsers_Pre($grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async* {
    yield* listUsers($call, await $request);
  }

  $async.Future<$0.UserResponse> getUser($grpc.ServiceCall call, $0.UserRequest request);
  $async.Future<$0.UserResponse> createUser($grpc.ServiceCall call, $0.CreateUserRequest request);
  $async.Stream<$0.UserResponse> listUsers($grpc.ServiceCall call, $0.Empty request);
}
