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

@$core.Deprecated('Use messageDescriptor instead')
const Message$json = {
  '1': 'Message',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    {'1': 'sender', '3': 2, '4': 1, '5': 9, '10': 'sender'},
    {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
    {'1': 'recipient', '3': 4, '4': 1, '5': 9, '10': 'recipient'},
    {'1': 'status', '3': 5, '4': 1, '5': 14, '6': '.connect.MessageStatus', '10': 'status'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEh0KCm1lc3NhZ2VfaWQYASABKAlSCW1lc3NhZ2VJZBIWCgZzZW5kZXIYAiABKA'
    'lSBnNlbmRlchIYCgdjb250ZW50GAMgASgJUgdjb250ZW50EhwKCXJlY2lwaWVudBgEIAEoCVIJ'
    'cmVjaXBpZW50Ei4KBnN0YXR1cxgFIAEoDjIWLmNvbm5lY3QuTWVzc2FnZVN0YXR1c1IGc3RhdH'
    'Vz');

@$core.Deprecated('Use chatDescriptor instead')
const Chat$json = {
  '1': 'Chat',
  '2': [
    {'1': 'chat_id', '3': 1, '4': 1, '5': 9, '10': 'chatId'},
    {'1': 'chat_type', '3': 2, '4': 1, '5': 9, '10': 'chatType'},
    {'1': 'participants', '3': 3, '4': 3, '5': 11, '6': '.connect.User', '10': 'participants'},
    {'1': 'created_at', '3': 4, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'updated_at', '3': 5, '4': 1, '5': 9, '10': 'updatedAt'},
    {'1': 'last_message', '3': 6, '4': 1, '5': 11, '6': '.connect.Message', '10': 'lastMessage'},
    {'1': 'group_metadata', '3': 7, '4': 1, '5': 11, '6': '.connect.GroupMetaData', '10': 'groupMetadata'},
  ],
};

/// Descriptor for `Chat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatDescriptor = $convert.base64Decode(
    'CgRDaGF0EhcKB2NoYXRfaWQYASABKAlSBmNoYXRJZBIbCgljaGF0X3R5cGUYAiABKAlSCGNoYX'
    'RUeXBlEjEKDHBhcnRpY2lwYW50cxgDIAMoCzINLmNvbm5lY3QuVXNlclIMcGFydGljaXBhbnRz'
    'Eh0KCmNyZWF0ZWRfYXQYBCABKAlSCWNyZWF0ZWRBdBIdCgp1cGRhdGVkX2F0GAUgASgJUgl1cG'
    'RhdGVkQXQSMwoMbGFzdF9tZXNzYWdlGAYgASgLMhAuY29ubmVjdC5NZXNzYWdlUgtsYXN0TWVz'
    'c2FnZRI9Cg5ncm91cF9tZXRhZGF0YRgHIAEoCzIWLmNvbm5lY3QuR3JvdXBNZXRhRGF0YVINZ3'
    'JvdXBNZXRhZGF0YQ==');

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

