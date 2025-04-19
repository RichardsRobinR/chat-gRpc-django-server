//
//  Generated code. Do not modify.
//  source: chat_service.proto
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

import 'chat_service.pb.dart' as $2;

export 'chat_service.pb.dart';

@$pb.GrpcServiceName('connect.ChatService')
class ChatServiceClient extends $grpc.Client {
  static final _$messageStream = $grpc.ClientMethod<$2.Message, $2.Message>(
      '/connect.ChatService/MessageStream',
      ($2.Message value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Message.fromBuffer(value));
  static final _$chatRoom = $grpc.ClientMethod<$2.GetOrCreateChatRoomRequest, $2.ChatResponse>(
      '/connect.ChatService/ChatRoom',
      ($2.GetOrCreateChatRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ChatResponse.fromBuffer(value));
  static final _$verifyUuid = $grpc.ClientMethod<$2.VerifyUuidRequest, $2.VerifyUuidResponse>(
      '/connect.ChatService/VerifyUuid',
      ($2.VerifyUuidRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.VerifyUuidResponse.fromBuffer(value));

  ChatServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$2.Message> messageStream($async.Stream<$2.Message> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$messageStream, request, options: options);
  }

  $grpc.ResponseFuture<$2.ChatResponse> chatRoom($2.GetOrCreateChatRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$chatRoom, request, options: options);
  }

  $grpc.ResponseFuture<$2.VerifyUuidResponse> verifyUuid($2.VerifyUuidRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyUuid, request, options: options);
  }
}

@$pb.GrpcServiceName('connect.ChatService')
abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'connect.ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.Message, $2.Message>(
        'MessageStream',
        messageStream,
        true,
        true,
        ($core.List<$core.int> value) => $2.Message.fromBuffer(value),
        ($2.Message value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetOrCreateChatRoomRequest, $2.ChatResponse>(
        'ChatRoom',
        chatRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetOrCreateChatRoomRequest.fromBuffer(value),
        ($2.ChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.VerifyUuidRequest, $2.VerifyUuidResponse>(
        'VerifyUuid',
        verifyUuid_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.VerifyUuidRequest.fromBuffer(value),
        ($2.VerifyUuidResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.ChatResponse> chatRoom_Pre($grpc.ServiceCall $call, $async.Future<$2.GetOrCreateChatRoomRequest> $request) async {
    return chatRoom($call, await $request);
  }

  $async.Future<$2.VerifyUuidResponse> verifyUuid_Pre($grpc.ServiceCall $call, $async.Future<$2.VerifyUuidRequest> $request) async {
    return verifyUuid($call, await $request);
  }

  $async.Stream<$2.Message> messageStream($grpc.ServiceCall call, $async.Stream<$2.Message> request);
  $async.Future<$2.ChatResponse> chatRoom($grpc.ServiceCall call, $2.GetOrCreateChatRoomRequest request);
  $async.Future<$2.VerifyUuidResponse> verifyUuid($grpc.ServiceCall call, $2.VerifyUuidRequest request);
}
