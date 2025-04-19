//
//  Generated code. Do not modify.
//  source: user_service.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'uuid', '3': 3, '4': 1, '5': 9, '10': 'uuid'},
    {'1': 'username', '3': 4, '4': 1, '5': 9, '10': 'username'},
    {'1': 'display_name', '3': 5, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'profile_image_url', '3': 6, '4': 1, '5': 9, '10': 'profileImageUrl'},
    {'1': 'phone_number', '3': 7, '4': 1, '5': 9, '10': 'phoneNumber'},
    {'1': 'bio', '3': 8, '4': 1, '5': 9, '10': 'bio'},
    {'1': 'is_online', '3': 9, '4': 1, '5': 8, '10': 'isOnline'},
    {'1': 'has_story', '3': 10, '4': 1, '5': 8, '10': 'hasStory'},
    {'1': 'last_seen', '3': 11, '4': 1, '5': 3, '10': 'lastSeen'},
    {'1': 'created_at', '3': 12, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'last_login', '3': 13, '4': 1, '5': 3, '10': 'lastLogin'},
    {'1': 'group_id', '3': 14, '4': 3, '5': 9, '10': 'groupId'},
    {'1': 'past_uuids', '3': 15, '4': 3, '5': 9, '10': 'pastUuids'},
    {'1': 'blocked_users_id', '3': 16, '4': 3, '5': 9, '10': 'blockedUsersId'},
    {'1': 'is_verified', '3': 17, '4': 1, '5': 8, '10': 'isVerified'},
    {'1': 'is_active', '3': 18, '4': 1, '5': 8, '10': 'isActive'},
    {'1': 'is_staff', '3': 19, '4': 1, '5': 8, '10': 'isStaff'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgJUgJpZBIQCgN1aWQYAiABKAlSA3VpZBISCgR1dWlkGAMgASgJUg'
    'R1dWlkEhoKCHVzZXJuYW1lGAQgASgJUgh1c2VybmFtZRIhCgxkaXNwbGF5X25hbWUYBSABKAlS'
    'C2Rpc3BsYXlOYW1lEioKEXByb2ZpbGVfaW1hZ2VfdXJsGAYgASgJUg9wcm9maWxlSW1hZ2VVcm'
    'wSIQoMcGhvbmVfbnVtYmVyGAcgASgJUgtwaG9uZU51bWJlchIQCgNiaW8YCCABKAlSA2JpbxIb'
    'Cglpc19vbmxpbmUYCSABKAhSCGlzT25saW5lEhsKCWhhc19zdG9yeRgKIAEoCFIIaGFzU3Rvcn'
    'kSGwoJbGFzdF9zZWVuGAsgASgDUghsYXN0U2VlbhIdCgpjcmVhdGVkX2F0GAwgASgDUgljcmVh'
    'dGVkQXQSHQoKbGFzdF9sb2dpbhgNIAEoA1IJbGFzdExvZ2luEhkKCGdyb3VwX2lkGA4gAygJUg'
    'dncm91cElkEh0KCnBhc3RfdXVpZHMYDyADKAlSCXBhc3RVdWlkcxIoChBibG9ja2VkX3VzZXJz'
    'X2lkGBAgAygJUg5ibG9ja2VkVXNlcnNJZBIfCgtpc192ZXJpZmllZBgRIAEoCFIKaXNWZXJpZm'
    'llZBIbCglpc19hY3RpdmUYEiABKAhSCGlzQWN0aXZlEhkKCGlzX3N0YWZmGBMgASgIUgdpc1N0'
    'YWZm');

@$core.Deprecated('Use userRequestDescriptor instead')
const UserRequest$json = {
  '1': 'UserRequest',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `UserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userRequestDescriptor = $convert.base64Decode(
    'CgtVc2VyUmVxdWVzdBIQCgN1aWQYASABKAlSA3VpZA==');

@$core.Deprecated('Use userResponseDescriptor instead')
const UserResponse$json = {
  '1': 'UserResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.connect.User', '10': 'user'},
  ],
};

/// Descriptor for `UserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userResponseDescriptor = $convert.base64Decode(
    'CgxVc2VyUmVzcG9uc2USIQoEdXNlchgBIAEoCzINLmNvbm5lY3QuVXNlclIEdXNlcg==');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

