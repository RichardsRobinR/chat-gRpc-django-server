//
//  Generated code. Do not modify.
//  source: chat_service.proto
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
    {'1': 'SENDING', '2': 0},
    {'1': 'SENT', '2': 1},
    {'1': 'DELIVERED', '2': 2},
    {'1': 'READ', '2': 3},
    {'1': 'FAILED', '2': 4},
  ],
};

/// Descriptor for `MessageStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List messageStatusDescriptor = $convert.base64Decode(
    'Cg1NZXNzYWdlU3RhdHVzEgsKB1NFTkRJTkcQABIICgRTRU5UEAESDQoJREVMSVZFUkVEEAISCA'
    'oEUkVBRBADEgoKBkZBSUxFRBAE');

@$core.Deprecated('Use chatSourceDescriptor instead')
const ChatSource$json = {
  '1': 'ChatSource',
  '2': [
    {'1': 'PHONE_NUMBER', '2': 0},
    {'1': 'UUID', '2': 1},
  ],
};

/// Descriptor for `ChatSource`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List chatSourceDescriptor = $convert.base64Decode(
    'CgpDaGF0U291cmNlEhAKDFBIT05FX05VTUJFUhAAEggKBFVVSUQQAQ==');

@$core.Deprecated('Use chatRequestStatusDescriptor instead')
const ChatRequestStatus$json = {
  '1': 'ChatRequestStatus',
  '2': [
    {'1': 'PENDING', '2': 0},
    {'1': 'ACCEPTED', '2': 1},
    {'1': 'REJECTED', '2': 2},
  ],
};

/// Descriptor for `ChatRequestStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List chatRequestStatusDescriptor = $convert.base64Decode(
    'ChFDaGF0UmVxdWVzdFN0YXR1cxILCgdQRU5ESU5HEAASDAoIQUNDRVBURUQQARIMCghSRUpFQ1'
    'RFRBAC');

@$core.Deprecated('Use messageTypeDescriptor instead')
const MessageType$json = {
  '1': 'MessageType',
  '2': [
    {'1': 'text', '2': 0},
    {'1': 'image', '2': 1},
    {'1': 'video', '2': 2},
    {'1': 'audio', '2': 3},
    {'1': 'file', '2': 4},
    {'1': 'document', '2': 5},
    {'1': 'story_reply', '2': 6},
    {'1': 'other', '2': 7},
  ],
};

/// Descriptor for `MessageType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List messageTypeDescriptor = $convert.base64Decode(
    'CgtNZXNzYWdlVHlwZRIICgR0ZXh0EAASCQoFaW1hZ2UQARIJCgV2aWRlbxACEgkKBWF1ZGlvEA'
    'MSCAoEZmlsZRAEEgwKCGRvY3VtZW50EAUSDwoLc3RvcnlfcmVwbHkQBhIJCgVvdGhlchAH');

@$core.Deprecated('Use getOrCreateChatRoomRequestDescriptor instead')
const GetOrCreateChatRoomRequest$json = {
  '1': 'GetOrCreateChatRoomRequest',
  '2': [
    {'1': 'current_user_uid', '3': 1, '4': 1, '5': 9, '10': 'currentUserUid'},
    {'1': 'other_user_uid', '3': 2, '4': 1, '5': 9, '10': 'otherUserUid'},
    {'1': 'current_user_phone_number', '3': 3, '4': 1, '5': 9, '10': 'currentUserPhoneNumber'},
    {'1': 'chat_source', '3': 4, '4': 1, '5': 14, '6': '.connect.ChatSource', '10': 'chatSource'},
  ],
};

/// Descriptor for `GetOrCreateChatRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrCreateChatRoomRequestDescriptor = $convert.base64Decode(
    'ChpHZXRPckNyZWF0ZUNoYXRSb29tUmVxdWVzdBIoChBjdXJyZW50X3VzZXJfdWlkGAEgASgJUg'
    '5jdXJyZW50VXNlclVpZBIkCg5vdGhlcl91c2VyX3VpZBgCIAEoCVIMb3RoZXJVc2VyVWlkEjkK'
    'GWN1cnJlbnRfdXNlcl9waG9uZV9udW1iZXIYAyABKAlSFmN1cnJlbnRVc2VyUGhvbmVOdW1iZX'
    'ISNAoLY2hhdF9zb3VyY2UYBCABKA4yEy5jb25uZWN0LkNoYXRTb3VyY2VSCmNoYXRTb3VyY2U=');

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
    {'1': 'media_url', '3': 7, '4': 1, '5': 9, '10': 'mediaUrl'},
    {'1': 'timestamp', '3': 8, '4': 1, '5': 5, '10': 'timestamp'},
    {'1': 'file_size', '3': 9, '4': 1, '5': 5, '10': 'fileSize'},
    {'1': 'local_media_path', '3': 10, '4': 1, '5': 9, '10': 'localMediaPath'},
    {'1': 'thumbnail_path', '3': 11, '4': 1, '5': 9, '10': 'thumbnailPath'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEg4KAmlkGAEgASgJUgJpZBIdCgpzZW5kZXJfcmVmGAIgASgJUglzZW5kZXJSZW'
    'YSGAoHY29udGVudBgDIAEoCVIHY29udGVudBIjCg1yZWNpcGllbnRfcmVmGAQgASgJUgxyZWNp'
    'cGllbnRSZWYSLgoGc3RhdHVzGAUgASgOMhYuY29ubmVjdC5NZXNzYWdlU3RhdHVzUgZzdGF0dX'
    'MSIgoNY2hhdF9yb29tX3JlZhgGIAEoCVILY2hhdFJvb21SZWYSGwoJbWVkaWFfdXJsGAcgASgJ'
    'UghtZWRpYVVybBIcCgl0aW1lc3RhbXAYCCABKAVSCXRpbWVzdGFtcBIbCglmaWxlX3NpemUYCS'
    'ABKAVSCGZpbGVTaXplEigKEGxvY2FsX21lZGlhX3BhdGgYCiABKAlSDmxvY2FsTWVkaWFQYXRo'
    'EiUKDnRodW1ibmFpbF9wYXRoGAsgASgJUg10aHVtYm5haWxQYXRo');

@$core.Deprecated('Use chatResponseDescriptor instead')
const ChatResponse$json = {
  '1': 'ChatResponse',
  '2': [
    {'1': 'chat', '3': 1, '4': 1, '5': 11, '6': '.connect.Chat', '10': 'chat'},
    {'1': 'user', '3': 2, '4': 3, '5': 11, '6': '.connect.User', '10': 'user'},
  ],
};

/// Descriptor for `ChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatResponseDescriptor = $convert.base64Decode(
    'CgxDaGF0UmVzcG9uc2USIQoEY2hhdBgBIAEoCzINLmNvbm5lY3QuQ2hhdFIEY2hhdBIhCgR1c2'
    'VyGAIgAygLMg0uY29ubmVjdC5Vc2VyUgR1c2Vy');

@$core.Deprecated('Use chatDescriptor instead')
const Chat$json = {
  '1': 'Chat',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'participants_uid', '3': 2, '4': 3, '5': 11, '6': '.connect.Chat.ParticipantsUidEntry', '10': 'participantsUid'},
    {'1': 'last_message', '3': 3, '4': 1, '5': 9, '10': 'lastMessage'},
    {'1': 'last_message_sender_ref', '3': 4, '4': 1, '5': 9, '10': 'lastMessageSenderRef'},
    {'1': 'last_read_time', '3': 5, '4': 3, '5': 11, '6': '.connect.Chat.LastReadTimeEntry', '10': 'lastReadTime'},
    {'1': 'unread_counts', '3': 6, '4': 3, '5': 11, '6': '.connect.Chat.UnreadCountsEntry', '10': 'unreadCounts'},
    {'1': 'chat_request_status', '3': 7, '4': 1, '5': 14, '6': '.connect.ChatRequestStatus', '10': 'chatRequestStatus'},
    {'1': 'chat_source', '3': 8, '4': 1, '5': 14, '6': '.connect.ChatSource', '10': 'chatSource'},
    {'1': 'initiated_by_phone_number', '3': 9, '4': 1, '5': 8, '10': 'initiatedByPhoneNumber'},
    {'1': 'message_type', '3': 10, '4': 1, '5': 14, '6': '.connect.MessageType', '10': 'messageType'},
  ],
  '3': [Chat_ParticipantsUidEntry$json, Chat_LastReadTimeEntry$json, Chat_UnreadCountsEntry$json],
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

@$core.Deprecated('Use chatDescriptor instead')
const Chat_LastReadTimeEntry$json = {
  '1': 'LastReadTimeEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use chatDescriptor instead')
const Chat_UnreadCountsEntry$json = {
  '1': 'UnreadCountsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Chat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatDescriptor = $convert.base64Decode(
    'CgRDaGF0Eg4KAmlkGAEgASgJUgJpZBJNChBwYXJ0aWNpcGFudHNfdWlkGAIgAygLMiIuY29ubm'
    'VjdC5DaGF0LlBhcnRpY2lwYW50c1VpZEVudHJ5Ug9wYXJ0aWNpcGFudHNVaWQSIQoMbGFzdF9t'
    'ZXNzYWdlGAMgASgJUgtsYXN0TWVzc2FnZRI1ChdsYXN0X21lc3NhZ2Vfc2VuZGVyX3JlZhgEIA'
    'EoCVIUbGFzdE1lc3NhZ2VTZW5kZXJSZWYSRQoObGFzdF9yZWFkX3RpbWUYBSADKAsyHy5jb25u'
    'ZWN0LkNoYXQuTGFzdFJlYWRUaW1lRW50cnlSDGxhc3RSZWFkVGltZRJECg11bnJlYWRfY291bn'
    'RzGAYgAygLMh8uY29ubmVjdC5DaGF0LlVucmVhZENvdW50c0VudHJ5Ugx1bnJlYWRDb3VudHMS'
    'SgoTY2hhdF9yZXF1ZXN0X3N0YXR1cxgHIAEoDjIaLmNvbm5lY3QuQ2hhdFJlcXVlc3RTdGF0dX'
    'NSEWNoYXRSZXF1ZXN0U3RhdHVzEjQKC2NoYXRfc291cmNlGAggASgOMhMuY29ubmVjdC5DaGF0'
    'U291cmNlUgpjaGF0U291cmNlEjkKGWluaXRpYXRlZF9ieV9waG9uZV9udW1iZXIYCSABKAhSFm'
    'luaXRpYXRlZEJ5UGhvbmVOdW1iZXISNwoMbWVzc2FnZV90eXBlGAogASgOMhQuY29ubmVjdC5N'
    'ZXNzYWdlVHlwZVILbWVzc2FnZVR5cGUaQgoUUGFydGljaXBhbnRzVWlkRW50cnkSEAoDa2V5GA'
    'EgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4ARo/ChFMYXN0UmVhZFRpbWVFbnRy'
    'eRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoBVIFdmFsdWU6AjgBGj8KEVVucmVhZE'
    'NvdW50c0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgFUgV2YWx1ZToCOAE=');

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

