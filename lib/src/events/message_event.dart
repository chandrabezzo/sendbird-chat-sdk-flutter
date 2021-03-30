import 'package:json_annotation/json_annotation.dart';

import 'base_event.dart';

import '../constant/enums.dart';
import '../core/message/file_message.dart';
import '../core/models/sender.dart';
import '../core/models/user.dart';

part 'message_event.g.dart';

/// Represents message event
@JsonSerializable()
class MessageEvent extends BaseEvent {
  @JsonKey(name: 'req_id')
  String requestId;

  @JsonKey(name: 'msg_id')
  final int messageId;

  final bool forceUpdateLastMessage;

  final bool silent;

  final String channelUrl;

  @JsonKey(unknownEnumValue: ChannelType.group)
  final ChannelType channelType;

  @JsonKey(unknownEnumValue: MentionType.users)
  final MentionType mentionType;

  @JsonKey(name: 'user')
  final Sender sender;

  final List<User> mentionedUsers;

  final List<Thumbnail> thumbnails;

  final Map<String, dynamic> oldValues;

  MessageEvent({
    this.requestId,
    this.messageId,
    this.forceUpdateLastMessage,
    this.silent,
    this.channelType,
    this.channelUrl,
    this.sender,
    this.mentionType,
    this.mentionedUsers,
    this.thumbnails,
    this.oldValues,
  });

  factory MessageEvent.fromJson(Map<String, dynamic> json) =>
      _$MessageEventFromJson(json);

  MentionType hasChangedMentionType() {
    if (oldValues == null || oldValues['mention_type'] == null) {
      return null;
    }
    final oldMentionType =
        MentionType.values.enumFromString(oldValues['mention_type']);

    return oldMentionType != mentionType ? mentionType : null;
  }

  bool previousMentionedContains(User user) {
    if (oldValues == null || oldValues['mentioned_user_ids'] == null) {
      return null;
    }
    List<String> previous = oldValues['mentioned_user_ids'];
    return previous.contains(user.userId);
  }

  bool mentionedContains(User user) {
    return mentionedUsers.firstWhere((e) => e.userId == user.userId) != null;
  }
}