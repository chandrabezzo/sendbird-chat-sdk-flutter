import 'package:json_annotation/json_annotation.dart';

part 'app_info.g.dart';

/// Represents current Sendbird application information.
@JsonSerializable(createToJson: false)
class AppInfo {
  /// Latest hash value for emoji
  final String emojiHash;

  /// Uplodable file size limit (unit in bytes)
  @JsonKey(defaultValue: 30 * 1024 * 1024)
  final int uploadSizeLimit;

  /// List of premium feature on current application id
  final List<String> premiumFeatureList;

  /// True if reaction feature is enabled
  final bool useReaction;

  /// list of application attributes of current application id
  final List<String> applicationAttributes;

  AppInfo({
    this.emojiHash,
    this.uploadSizeLimit,
    this.premiumFeatureList,
    this.useReaction,
    this.applicationAttributes,
  });

  /// Return `true` if a given [prevEmojiHash] is outdated
  bool isEmojiUpdatedNeeded(String prevEmojiHash) {
    return emojiHash != prevEmojiHash;
  }

  factory AppInfo.fromJson(Map<String, dynamic> json) =>
      _$AppInfoFromJson(json);
}