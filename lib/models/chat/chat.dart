import 'package:json_annotation/json_annotation.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat {
  /// The generated code assumes these values exist in JSON.
  final String id;
  final String text;
  final User user;

  @JsonKey(name: "reply_count")
  final int replyCount;
  @JsonKey(name: "unread_count")
  final int unreadCount;
  @JsonKey(name: "created_at")
  final String createdAt;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.

  Chat(
      {required this.id,
      required this.text,
      required this.user,
      required this.replyCount,
      required this.unreadCount,
      required this.createdAt});

  /// factory.
  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}

@JsonSerializable()
class Chats {
  final List<Chat> results;
  Chats(this.results);

  factory Chats.fromJson(Map<String, dynamic> json) => _$ChatsFromJson(json);
  Map<String, dynamic> toJson() => _$ChatsToJson(this);
}
