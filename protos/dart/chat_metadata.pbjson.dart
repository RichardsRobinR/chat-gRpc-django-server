//
//  Generated code. Do not modify.
//  source: chat_metadata.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use messageStatusDescriptor instead')
const MessageStatus$json = {
  '1': 'MessageStatus',
  '2': [
    {'1': 'SENT', '2': 0},
    {'1': 'DELIVERED', '2': 1},
    {'1': 'READ', '2': 2},
    {'1': 'ERROR', '2': 3},
  ],
};

/// Descriptor for `MessageStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List messageStatusDescriptor = $convert.base64Decode(
    'Cg1NZXNzYWdlU3RhdHVzEggKBFNFTlQQABINCglERUxJVkVSRUQQARIICgRSRUFEEAISCQoFRV'
    'JST1IQAw==');

@$core.Deprecated('Use getOrCreateChatRoomRequestDescriptor instead')
const GetOrCreateChatRoomRequest$json = {
  '1': 'GetOrCreateChatRoomRequest',
  '2': [
    {'1': 'current_user_uid', '3': 1, '4': 1, '5': 9, '10': 'currentUserUid'},
    {'1': 'other_user_uid', '3': 2, '4': 1, '5': 9, '10': 'otherUserUid'},
    {'1': 'current_user_phone_number', '3': 3, '4': 1, '5': 9, '10': 'currentUserPhoneNumber'},
    {'1': 'chat_source', '3': 4, '4': 1, '5': 9, '10': 'chatSource'},
  ],
};

/// Descriptor for `GetOrCreateChatRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrCreateChatRoomRequestDescriptor = $convert.base64Decode(
    'ChpHZXRPckNyZWF0ZUNoYXRSb29tUmVxdWVzdBIoChBjdXJyZW50X3VzZXJfdWlkGAEgASgJUg'
    '5jdXJyZW50VXNlclVpZBIkCg5vdGhlcl91c2VyX3VpZBgCIAEoCVIMb3RoZXJVc2VyVWlkEjkK'
    'GWN1cnJlbnRfdXNlcl9waG9uZV9udW1iZXIYAyABKAlSFmN1cnJlbnRVc2VyUGhvbmVOdW1iZX'
    'ISHwoLY2hhdF9zb3VyY2UYBCABKAlSCmNoYXRTb3VyY2U=');

@$core.Deprecated('Use messageDescriptor instead')
const Message$json = {
  '1': 'Message',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'sender_ref', '3': 2, '4': 1, '5': 9, '10': 'senderRef'},
    {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
    {'1': 'recipient_ref', '3': 4, '4': 1, '5': 9, '10': 'recipientRef'},
    {'1': 'status', '3': 5, '4': 1, '5': 14, '6': '.connect.MessageStatus', '10': 'status'},
    {'1': 'chat_room_ref', '3': 6, '4': 1, '5': 9, '10': 'chatRoomRef'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEg4KAmlkGAEgASgJUgJpZBIdCgpzZW5kZXJfcmVmGAIgASgJUglzZW5kZXJSZW'
    'YSGAoHY29udGVudBgDIAEoCVIHY29udGVudBIjCg1yZWNpcGllbnRfcmVmGAQgASgJUgxyZWNp'
    'cGllbnRSZWYSLgoGc3RhdHVzGAUgASgOMhYuY29ubmVjdC5NZXNzYWdlU3RhdHVzUgZzdGF0dX'
    'MSIgoNY2hhdF9yb29tX3JlZhgGIAEoCVILY2hhdFJvb21SZWY=');

@$core.Deprecated('Use chatResponseDescriptor instead')
const ChatResponse$json = {
  '1': 'ChatResponse',
  '2': [
    {'1': 'chat', '3': 1, '4': 1, '5': 11, '6': '.connect.Chat', '10': 'chat'},
  ],
};

/// Descriptor for `ChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatResponseDescriptor = $convert.base64Decode(
    'CgxDaGF0UmVzcG9uc2USIQoEY2hhdBgBIAEoCzINLmNvbm5lY3QuQ2hhdFIEY2hhdA==');

@$core.Deprecated('Use chatDescriptor instead')
const Chat$json = {
  '1': 'Chat',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'participants_uid', '3': 2, '4': 3, '5': 11, '6': '.connect.Chat.ParticipantsUidEntry', '10': 'participantsUid'},
    {'1': 'last_message', '3': 3, '4': 1, '5': 9, '10': 'lastMessage'},
    {'1': 'chat_source', '3': 4, '4': 1, '5': 9, '10': 'chatSource'},
    {'1': 'initiated_by_phone_number', '3': 5, '4': 1, '5': 8, '10': 'initiatedByPhoneNumber'},
  ],
  '3': [Chat_ParticipantsUidEntry$json],
};

@$core.Deprecated('Use chatDescriptor instead')
const Chat_ParticipantsUidEntry$json = {
  '1': 'ParticipantsUidEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Chat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatDescriptor = $convert.base64Decode(
    'CgRDaGF0Eg4KAmlkGAEgASgJUgJpZBJNChBwYXJ0aWNpcGFudHNfdWlkGAIgAygLMiIuY29ubm'
    'VjdC5DaGF0LlBhcnRpY2lwYW50c1VpZEVudHJ5Ug9wYXJ0aWNpcGFudHNVaWQSIQoMbGFzdF9t'
    'ZXNzYWdlGAMgASgJUgtsYXN0TWVzc2FnZRIfCgtjaGF0X3NvdXJjZRgEIAEoCVIKY2hhdFNvdX'
    'JjZRI5Chlpbml0aWF0ZWRfYnlfcGhvbmVfbnVtYmVyGAUgASgIUhZpbml0aWF0ZWRCeVBob25l'
    'TnVtYmVyGkIKFFBhcnRpY2lwYW50c1VpZEVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbH'
    'VlGAIgASgJUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use groupMetaDataDescriptor instead')
const GroupMetaData$json = {
  '1': 'GroupMetaData',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'creation_date', '3': 3, '4': 1, '5': 9, '10': 'creationDate'},
    {'1': 'created_by', '3': 4, '4': 1, '5': 11, '6': '.connect.User', '10': 'createdBy'},
    {'1': 'admins', '3': 5, '4': 3, '5': 11, '6': '.connect.User', '10': 'admins'},
    {'1': 'profile_picture', '3': 6, '4': 1, '5': 9, '10': 'profilePicture'},
  ],
};

/// Descriptor for `GroupMetaData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupMetaDataDescriptor = $convert.base64Decode(
    'Cg1Hcm91cE1ldGFEYXRhEhIKBG5hbWUYASABKAlSBG5hbWUSIAoLZGVzY3JpcHRpb24YAiABKA'
    'lSC2Rlc2NyaXB0aW9uEiMKDWNyZWF0aW9uX2RhdGUYAyABKAlSDGNyZWF0aW9uRGF0ZRIsCgpj'
    'cmVhdGVkX2J5GAQgASgLMg0uY29ubmVjdC5Vc2VyUgljcmVhdGVkQnkSJQoGYWRtaW5zGAUgAy'
    'gLMg0uY29ubmVjdC5Vc2VyUgZhZG1pbnMSJwoPcHJvZmlsZV9waWN0dXJlGAYgASgJUg5wcm9m'
    'aWxlUGljdHVyZQ==');

@$core.Deprecated('Use verifyUuidRequestDescriptor instead')
const VerifyUuidRequest$json = {
  '1': 'VerifyUuidRequest',
  '2': [
    {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
  ],
};

/// Descriptor for `VerifyUuidRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyUuidRequestDescriptor = $convert.base64Decode(
    'ChFWZXJpZnlVdWlkUmVxdWVzdBISCgR1dWlkGAEgASgJUgR1dWlk');

@$core.Deprecated('Use verifyUuidResponseDescriptor instead')
const VerifyUuidResponse$json = {
  '1': 'VerifyUuidResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.connect.User', '10': 'user'},
  ],
};

/// Descriptor for `VerifyUuidResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyUuidResponseDescriptor = $convert.base64Decode(
    'ChJWZXJpZnlVdWlkUmVzcG9uc2USIQoEdXNlchgBIAEoCzINLmNvbm5lY3QuVXNlclIEdXNlcg'
    '==');

