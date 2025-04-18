//
//  Generated code. Do not modify.
//  source: chat_service.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MessageStatus extends $pb.ProtobufEnum {
  static const MessageStatus SENDING = MessageStatus._(0, _omitEnumNames ? '' : 'SENDING');
  static const MessageStatus SENT = MessageStatus._(1, _omitEnumNames ? '' : 'SENT');
  static const MessageStatus DELIVERED = MessageStatus._(2, _omitEnumNames ? '' : 'DELIVERED');
  static const MessageStatus READ = MessageStatus._(3, _omitEnumNames ? '' : 'READ');
  static const MessageStatus FAILED = MessageStatus._(4, _omitEnumNames ? '' : 'FAILED');

  static const $core.List<MessageStatus> values = <MessageStatus> [
    SENDING,
    SENT,
    DELIVERED,
    READ,
    FAILED,
  ];

  static final $core.Map<$core.int, MessageStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MessageStatus? valueOf($core.int value) => _byValue[value];

  const MessageStatus._(super.v, super.n);
}

class ChatSource extends $pb.ProtobufEnum {
  static const ChatSource PHONE_NUMBER = ChatSource._(0, _omitEnumNames ? '' : 'PHONE_NUMBER');
  static const ChatSource UUID = ChatSource._(1, _omitEnumNames ? '' : 'UUID');

  static const $core.List<ChatSource> values = <ChatSource> [
    PHONE_NUMBER,
    UUID,
  ];

  static final $core.Map<$core.int, ChatSource> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ChatSource? valueOf($core.int value) => _byValue[value];

  const ChatSource._(super.v, super.n);
}

class ChatRequestStatus extends $pb.ProtobufEnum {
  static const ChatRequestStatus PENDING = ChatRequestStatus._(0, _omitEnumNames ? '' : 'PENDING');
  static const ChatRequestStatus ACCEPTED = ChatRequestStatus._(1, _omitEnumNames ? '' : 'ACCEPTED');
  static const ChatRequestStatus REJECTED = ChatRequestStatus._(2, _omitEnumNames ? '' : 'REJECTED');

  static const $core.List<ChatRequestStatus> values = <ChatRequestStatus> [
    PENDING,
    ACCEPTED,
    REJECTED,
  ];

  static final $core.Map<$core.int, ChatRequestStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ChatRequestStatus? valueOf($core.int value) => _byValue[value];

  const ChatRequestStatus._(super.v, super.n);
}

class MessageType extends $pb.ProtobufEnum {
  static const MessageType text = MessageType._(0, _omitEnumNames ? '' : 'text');
  static const MessageType image = MessageType._(1, _omitEnumNames ? '' : 'image');
  static const MessageType video = MessageType._(2, _omitEnumNames ? '' : 'video');
  static const MessageType audio = MessageType._(3, _omitEnumNames ? '' : 'audio');
  static const MessageType file = MessageType._(4, _omitEnumNames ? '' : 'file');
  static const MessageType document = MessageType._(5, _omitEnumNames ? '' : 'document');
  static const MessageType story_reply = MessageType._(6, _omitEnumNames ? '' : 'story_reply');
  static const MessageType other = MessageType._(7, _omitEnumNames ? '' : 'other');

  static const $core.List<MessageType> values = <MessageType> [
    text,
    image,
    video,
    audio,
    file,
    document,
    story_reply,
    other,
  ];

  static final $core.Map<$core.int, MessageType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MessageType? valueOf($core.int value) => _byValue[value];

  const MessageType._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
