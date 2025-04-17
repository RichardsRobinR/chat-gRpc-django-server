//
//  Generated code. Do not modify.
//  source: chat_metadata.proto
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

import 'chat_metadata.pb.dart' as $1;

export 'chat_metadata.pb.dart';

@$pb.GrpcServiceName('connect.ChatService')
class ChatServiceClient extends $grpc.Client {
  static final _$messageStream = $grpc.ClientMethod<$1.Message, $1.Message>(
      '/connect.ChatService/MessageStream',
      ($1.Message value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Message.fromBuffer(value));
  static final _$chatRoom = $grpc.ClientMethod<$1.GetOrCreateChatRoomRequest, $1.ChatResponse>(
      '/connect.ChatService/ChatRoom',
      ($1.GetOrCreateChatRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ChatResponse.fromBuffer(value));

  ChatServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$1.Message> messageStream($async.Stream<$1.Message> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$messageStream, request, options: options);
  }

  $grpc.ResponseFuture<$1.ChatResponse> chatRoom($1.GetOrCreateChatRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$chatRoom, request, options: options);
  }
}

@$pb.GrpcServiceName('connect.ChatService')
abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'connect.ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.Message, $1.Message>(
        'MessageStream',
        messageStream,
        true,
        true,
        ($core.List<$core.int> value) => $1.Message.fromBuffer(value),
        ($1.Message value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetOrCreateChatRoomRequest, $1.ChatResponse>(
        'ChatRoom',
        chatRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetOrCreateChatRoomRequest.fromBuffer(value),
        ($1.ChatResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.ChatResponse> chatRoom_Pre($grpc.ServiceCall $call, $async.Future<$1.GetOrCreateChatRoomRequest> $request) async {
    return chatRoom($call, await $request);
  }

  $async.Stream<$1.Message> messageStream($grpc.ServiceCall call, $async.Stream<$1.Message> request);
  $async.Future<$1.ChatResponse> chatRoom($grpc.ServiceCall call, $1.GetOrCreateChatRoomRequest request);
}
