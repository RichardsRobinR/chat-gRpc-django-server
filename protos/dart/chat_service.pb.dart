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

import 'chat_service.pbenum.dart';
import 'user_service.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'chat_service.pbenum.dart';

class GetOrCreateChatRoomRequest extends $pb.GeneratedMessage {
  factory GetOrCreateChatRoomRequest({
    $core.String? currentUserUid,
    $core.String? otherUserUid,
    $core.String? currentUserPhoneNumber,
    ChatSource? chatSource,
  }) {
    final $result = create();
    if (currentUserUid != null) {
      $result.currentUserUid = currentUserUid;
    }
    if (otherUserUid != null) {
      $result.otherUserUid = otherUserUid;
    }
    if (currentUserPhoneNumber != null) {
      $result.currentUserPhoneNumber = currentUserPhoneNumber;
    }
    if (chatSource != null) {
      $result.chatSource = chatSource;
    }
    return $result;
  }
  GetOrCreateChatRoomRequest._() : super();
  factory GetOrCreateChatRoomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetOrCreateChatRoomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetOrCreateChatRoomRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'connect'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'currentUserUid')
    ..aOS(2, _omitFieldNames ? '' : 'otherUserUid')
    ..aOS(3, _omitFieldNames ? '' : 'currentUserPhoneNumber')
    ..e<ChatSource>(4, _omitFieldNames ? '' : 'chatSource', $pb.PbFieldType.OE, defaultOrMaker: ChatSource.PHONE_NUMBER, valueOf: ChatSource.valueOf, enumValues: ChatSource.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetOrCreateChatRoomRequest clone() => GetOrCreateChatRoomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetOrCreateChatRoomRequest copyWith(void Function(GetOrCreateChatRoomRequest) updates) => super.copyWith((message) => updates(message as GetOrCreateChatRoomRequest)) as GetOrCreateChatRoomRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetOrCreateChatRoomRequest create() => GetOrCreateChatRoomRequest._();
  GetOrCreateChatRoomRequest createEmptyInstance() => create();
  static $pb.PbList<GetOrCreateChatRoomRequest> createRepeated() => $pb.PbList<GetOrCreateChatRoomRequest>();
  @$core.pragma('dart2js:noInline')
  static GetOrCreateChatRoomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetOrCreateChatRoomRequest>(create);
  static GetOrCreateChatRoomRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get currentUserUid => $_getSZ(0);
  @$pb.TagNumber(1)
  set currentUserUid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurrentUserUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentUserUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get otherUserUid => $_getSZ(1);
  @$pb.TagNumber(2)
  set otherUserUid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOtherUserUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearOtherUserUid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get currentUserPhoneNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set currentUserPhoneNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCurrentUserPhoneNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentUserPhoneNumber() => $_clearField(3);

  @$pb.TagNumber(4)
  ChatSource get chatSource => $_getN(3);
  @$pb.TagNumber(4)
  set chatSource(ChatSource v) { $_setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasChatSource() => $_has(3);
  @$pb.TagNumber(4)
  void clearChatSource() => $_clearField(4);
}

class Message extends $pb.GeneratedMessage {
  factory Message({
    $core.String? id,
    $core.String? senderRef,
    $core.String? content,
    $core.String? recipientRef,
    MessageStatus? status,
    $core.String? chatRoomRef,
    $core.String? mediaUrl,
    $core.int? timestamp,
    $core.int? fileSize,
    $core.String? localMediaPath,
    $core.String? thumbnailPath,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (senderRef != null) {
      $result.senderRef = senderRef;
    }
    if (content != null) {
      $result.content = content;
    }
    if (recipientRef != null) {
      $result.recipientRef = recipientRef;
    }
    if (status != null) {
      $result.status = status;
    }
    if (chatRoomRef != null) {
      $result.chatRoomRef = chatRoomRef;
    }
    if (mediaUrl != null) {
      $result.mediaUrl = mediaUrl;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (fileSize != null) {
      $result.fileSize = fileSize;
    }
    if (localMediaPath != null) {
      $result.localMediaPath = localMediaPath;
    }
    if (thumbnailPath != null) {
      $result.thumbnailPath = thumbnailPath;
    }
    return $result;
  }
  Message._() : super();
  factory Message.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Message.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Message', package: const $pb.PackageName(_omitMessageNames ? '' : 'connect'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'senderRef')
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..aOS(4, _omitFieldNames ? '' : 'recipientRef')
    ..e<MessageStatus>(5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: MessageStatus.SENDING, valueOf: MessageStatus.valueOf, enumValues: MessageStatus.values)
    ..aOS(6, _omitFieldNames ? '' : 'chatRoomRef')
    ..aOS(7, _omitFieldNames ? '' : 'mediaUrl')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'timestamp', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'fileSize', $pb.PbFieldType.O3)
    ..aOS(10, _omitFieldNames ? '' : 'localMediaPath')
    ..aOS(11, _omitFieldNames ? '' : 'thumbnailPath')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Message clone() => Message()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Message copyWith(void Function(Message) updates) => super.copyWith((message) => updates(message as Message)) as Message;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get senderRef => $_getSZ(1);
  @$pb.TagNumber(2)
  set senderRef($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSenderRef() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderRef() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get recipientRef => $_getSZ(3);
  @$pb.TagNumber(4)
  set recipientRef($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRecipientRef() => $_has(3);
  @$pb.TagNumber(4)
  void clearRecipientRef() => $_clearField(4);

  @$pb.TagNumber(5)
  MessageStatus get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(MessageStatus v) { $_setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get chatRoomRef => $_getSZ(5);
  @$pb.TagNumber(6)
  set chatRoomRef($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasChatRoomRef() => $_has(5);
  @$pb.TagNumber(6)
  void clearChatRoomRef() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get mediaUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set mediaUrl($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMediaUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearMediaUrl() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get timestamp => $_getIZ(7);
  @$pb.TagNumber(8)
  set timestamp($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTimestamp() => $_has(7);
  @$pb.TagNumber(8)
  void clearTimestamp() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get fileSize => $_getIZ(8);
  @$pb.TagNumber(9)
  set fileSize($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasFileSize() => $_has(8);
  @$pb.TagNumber(9)
  void clearFileSize() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get localMediaPath => $_getSZ(9);
  @$pb.TagNumber(10)
  set localMediaPath($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLocalMediaPath() => $_has(9);
  @$pb.TagNumber(10)
  void clearLocalMediaPath() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get thumbnailPath => $_getSZ(10);
  @$pb.TagNumber(11)
  set thumbnailPath($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasThumbnailPath() => $_has(10);
  @$pb.TagNumber(11)
  void clearThumbnailPath() => $_clearField(11);
}

class ChatResponse extends $pb.GeneratedMessage {
  factory ChatResponse({
    Chat? chat,
    $core.Iterable<$0.User>? user,
  }) {
    final $result = create();
    if (chat != null) {
      $result.chat = chat;
    }
    if (user != null) {
      $result.user.addAll(user);
    }
    return $result;
  }
  ChatResponse._() : super();
  factory ChatResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'connect'), createEmptyInstance: create)
    ..aOM<Chat>(1, _omitFieldNames ? '' : 'chat', subBuilder: Chat.create)
    ..pc<$0.User>(2, _omitFieldNames ? '' : 'user', $pb.PbFieldType.PM, subBuilder: $0.User.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatResponse clone() => ChatResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatResponse copyWith(void Function(ChatResponse) updates) => super.copyWith((message) => updates(message as ChatResponse)) as ChatResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatResponse create() => ChatResponse._();
  ChatResponse createEmptyInstance() => create();
  static $pb.PbList<ChatResponse> createRepeated() => $pb.PbList<ChatResponse>();
  @$core.pragma('dart2js:noInline')
  static ChatResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatResponse>(create);
  static ChatResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Chat get chat => $_getN(0);
  @$pb.TagNumber(1)
  set chat(Chat v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChat() => $_has(0);
  @$pb.TagNumber(1)
  void clearChat() => $_clearField(1);
  @$pb.TagNumber(1)
  Chat ensureChat() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<$0.User> get user => $_getList(1);
}

class Chat extends $pb.GeneratedMessage {
  factory Chat({
    $core.String? id,
    $pb.PbMap<$core.String, $core.String>? participantsUid,
    $core.String? lastMessage,
    $core.String? lastMessageSenderRef,
    $pb.PbMap<$core.String, $core.int>? lastReadTime,
    $pb.PbMap<$core.String, $core.int>? unreadCounts,
    ChatRequestStatus? chatRequestStatus,
    ChatSource? chatSource,
    $core.bool? initiatedByPhoneNumber,
    MessageType? messageType,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (participantsUid != null) {
      $result.participantsUid.addAll(participantsUid);
    }
    if (lastMessage != null) {
      $result.lastMessage = lastMessage;
    }
    if (lastMessageSenderRef != null) {
      $result.lastMessageSenderRef = lastMessageSenderRef;
    }
    if (lastReadTime != null) {
      $result.lastReadTime.addAll(lastReadTime);
    }
    if (unreadCounts != null) {
      $result.unreadCounts.addAll(unreadCounts);
    }
    if (chatRequestStatus != null) {
      $result.chatRequestStatus = chatRequestStatus;
    }
    if (chatSource != null) {
      $result.chatSource = chatSource;
    }
    if (initiatedByPhoneNumber != null) {
      $result.initiatedByPhoneNumber = initiatedByPhoneNumber;
    }
    if (messageType != null) {
      $result.messageType = messageType;
    }
    return $result;
  }
  Chat._() : super();
  factory Chat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Chat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Chat', package: const $pb.PackageName(_omitMessageNames ? '' : 'connect'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..m<$core.String, $core.String>(2, _omitFieldNames ? '' : 'participantsUid', entryClassName: 'Chat.ParticipantsUidEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('connect'))
    ..aOS(3, _omitFieldNames ? '' : 'lastMessage')
    ..aOS(4, _omitFieldNames ? '' : 'lastMessageSenderRef')
    ..m<$core.String, $core.int>(5, _omitFieldNames ? '' : 'lastReadTime', entryClassName: 'Chat.LastReadTimeEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O3, packageName: const $pb.PackageName('connect'))
    ..m<$core.String, $core.int>(6, _omitFieldNames ? '' : 'unreadCounts', entryClassName: 'Chat.UnreadCountsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O3, packageName: const $pb.PackageName('connect'))
    ..e<ChatRequestStatus>(7, _omitFieldNames ? '' : 'chatRequestStatus', $pb.PbFieldType.OE, defaultOrMaker: ChatRequestStatus.PENDING, valueOf: ChatRequestStatus.valueOf, enumValues: ChatRequestStatus.values)
    ..e<ChatSource>(8, _omitFieldNames ? '' : 'chatSource', $pb.PbFieldType.OE, defaultOrMaker: ChatSource.PHONE_NUMBER, valueOf: ChatSource.valueOf, enumValues: ChatSource.values)
    ..aOB(9, _omitFieldNames ? '' : 'initiatedByPhoneNumber')
    ..e<MessageType>(10, _omitFieldNames ? '' : 'messageType', $pb.PbFieldType.OE, defaultOrMaker: MessageType.text, valueOf: MessageType.valueOf, enumValues: MessageType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Chat clone() => Chat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Chat copyWith(void Function(Chat) updates) => super.copyWith((message) => updates(message as Chat)) as Chat;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Chat create() => Chat._();
  Chat createEmptyInstance() => create();
  static $pb.PbList<Chat> createRepeated() => $pb.PbList<Chat>();
  @$core.pragma('dart2js:noInline')
  static Chat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Chat>(create);
  static Chat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.String> get participantsUid => $_getMap(1);

  @$pb.TagNumber(3)
  $core.String get lastMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastMessage($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastMessage() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get lastMessageSenderRef => $_getSZ(3);
  @$pb.TagNumber(4)
  set lastMessageSenderRef($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastMessageSenderRef() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastMessageSenderRef() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbMap<$core.String, $core.int> get lastReadTime => $_getMap(4);

  @$pb.TagNumber(6)
  $pb.PbMap<$core.String, $core.int> get unreadCounts => $_getMap(5);

  @$pb.TagNumber(7)
  ChatRequestStatus get chatRequestStatus => $_getN(6);
  @$pb.TagNumber(7)
  set chatRequestStatus(ChatRequestStatus v) { $_setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasChatRequestStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearChatRequestStatus() => $_clearField(7);

  @$pb.TagNumber(8)
  ChatSource get chatSource => $_getN(7);
  @$pb.TagNumber(8)
  set chatSource(ChatSource v) { $_setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasChatSource() => $_has(7);
  @$pb.TagNumber(8)
  void clearChatSource() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get initiatedByPhoneNumber => $_getBF(8);
  @$pb.TagNumber(9)
  set initiatedByPhoneNumber($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasInitiatedByPhoneNumber() => $_has(8);
  @$pb.TagNumber(9)
  void clearInitiatedByPhoneNumber() => $_clearField(9);

  @$pb.TagNumber(10)
  MessageType get messageType => $_getN(9);
  @$pb.TagNumber(10)
  set messageType(MessageType v) { $_setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasMessageType() => $_has(9);
  @$pb.TagNumber(10)
  void clearMessageType() => $_clearField(10);
}

class GroupMetaData extends $pb.GeneratedMessage {
  factory GroupMetaData({
    $core.String? name,
    $core.String? description,
    $core.String? creationDate,
    $0.User? createdBy,
    $core.Iterable<$0.User>? admins,
    $core.String? profilePicture,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (creationDate != null) {
      $result.creationDate = creationDate;
    }
    if (createdBy != null) {
      $result.createdBy = createdBy;
    }
    if (admins != null) {
      $result.admins.addAll(admins);
    }
    if (profilePicture != null) {
      $result.profilePicture = profilePicture;
    }
    return $result;
  }
  GroupMetaData._() : super();
  factory GroupMetaData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GroupMetaData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GroupMetaData', package: const $pb.PackageName(_omitMessageNames ? '' : 'connect'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aOS(3, _omitFieldNames ? '' : 'creationDate')
    ..aOM<$0.User>(4, _omitFieldNames ? '' : 'createdBy', subBuilder: $0.User.create)
    ..pc<$0.User>(5, _omitFieldNames ? '' : 'admins', $pb.PbFieldType.PM, subBuilder: $0.User.create)
    ..aOS(6, _omitFieldNames ? '' : 'profilePicture')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GroupMetaData clone() => GroupMetaData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GroupMetaData copyWith(void Function(GroupMetaData) updates) => super.copyWith((message) => updates(message as GroupMetaData)) as GroupMetaData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupMetaData create() => GroupMetaData._();
  GroupMetaData createEmptyInstance() => create();
  static $pb.PbList<GroupMetaData> createRepeated() => $pb.PbList<GroupMetaData>();
  @$core.pragma('dart2js:noInline')
  static GroupMetaData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GroupMetaData>(create);
  static GroupMetaData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get creationDate => $_getSZ(2);
  @$pb.TagNumber(3)
  set creationDate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreationDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreationDate() => $_clearField(3);

  @$pb.TagNumber(4)
  $0.User get createdBy => $_getN(3);
  @$pb.TagNumber(4)
  set createdBy($0.User v) { $_setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedBy() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedBy() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.User ensureCreatedBy() => $_ensure(3);

  @$pb.TagNumber(5)
  $pb.PbList<$0.User> get admins => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get profilePicture => $_getSZ(5);
  @$pb.TagNumber(6)
  set profilePicture($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasProfilePicture() => $_has(5);
  @$pb.TagNumber(6)
  void clearProfilePicture() => $_clearField(6);
}

class VerifyUuidRequest extends $pb.GeneratedMessage {
  factory VerifyUuidRequest({
    $core.String? uuid,
  }) {
    final $result = create();
    if (uuid != null) {
      $result.uuid = uuid;
    }
    return $result;
  }
  VerifyUuidRequest._() : super();
  factory VerifyUuidRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyUuidRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VerifyUuidRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'connect'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyUuidRequest clone() => VerifyUuidRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyUuidRequest copyWith(void Function(VerifyUuidRequest) updates) => super.copyWith((message) => updates(message as VerifyUuidRequest)) as VerifyUuidRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyUuidRequest create() => VerifyUuidRequest._();
  VerifyUuidRequest createEmptyInstance() => create();
  static $pb.PbList<VerifyUuidRequest> createRepeated() => $pb.PbList<VerifyUuidRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifyUuidRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyUuidRequest>(create);
  static VerifyUuidRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);
}

class VerifyUuidResponse extends $pb.GeneratedMessage {
  factory VerifyUuidResponse({
    $0.User? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  VerifyUuidResponse._() : super();
  factory VerifyUuidResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyUuidResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VerifyUuidResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'connect'), createEmptyInstance: create)
    ..aOM<$0.User>(1, _omitFieldNames ? '' : 'user', subBuilder: $0.User.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyUuidResponse clone() => VerifyUuidResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyUuidResponse copyWith(void Function(VerifyUuidResponse) updates) => super.copyWith((message) => updates(message as VerifyUuidResponse)) as VerifyUuidResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyUuidResponse create() => VerifyUuidResponse._();
  VerifyUuidResponse createEmptyInstance() => create();
  static $pb.PbList<VerifyUuidResponse> createRepeated() => $pb.PbList<VerifyUuidResponse>();
  @$core.pragma('dart2js:noInline')
  static VerifyUuidResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyUuidResponse>(create);
  static VerifyUuidResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.User v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.User ensureUser() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
