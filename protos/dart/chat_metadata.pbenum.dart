//
//  Generated code. Do not modify.
//  source: chat_metadata.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MessageStatus extends $pb.ProtobufEnum {
  static const MessageStatus SENT = MessageStatus._(0, _omitEnumNames ? '' : 'SENT');
  static const MessageStatus DELIVERED = MessageStatus._(1, _omitEnumNames ? '' : 'DELIVERED');
  static const MessageStatus READ = MessageStatus._(2, _omitEnumNames ? '' : 'READ');
  static const MessageStatus ERROR = MessageStatus._(3, _omitEnumNames ? '' : 'ERROR');

  static const $core.List<MessageStatus> values = <MessageStatus> [
    SENT,
    DELIVERED,
    READ,
    ERROR,
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


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
