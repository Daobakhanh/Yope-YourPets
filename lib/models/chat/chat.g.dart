// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      id: json['id'] as String,
      text: json['text'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      replyCount: json['reply_count'] as int,
      unreadCount: json['unread_count'] as int,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'user': instance.user,
      'reply_count': instance.replyCount,
      'unread_count': instance.unreadCount,
      'created_at': instance.createdAt,
    };

Chats _$ChatsFromJson(Map<String, dynamic> json) => Chats(
      (json['results'] as List<dynamic>)
          .map((e) => Chat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatsToJson(Chats instance) => <String, dynamic>{
      'results': instance.results,
    };
