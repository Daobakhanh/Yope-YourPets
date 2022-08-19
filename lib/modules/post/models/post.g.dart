// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String?,
      status: json['status'] as int?,
      title: json['title'] as String,
      description: json['description'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      commentCounts: json['commentCounts'] as int,
      likeCounts: json['likeCounts'] as int,
      liked: json['liked'] as bool,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'title': instance.title,
      'description': instance.description,
      'photos': instance.photos,
      'commentCounts': instance.commentCounts,
      'likeCounts': instance.likeCounts,
      'liked': instance.liked,
    };

Posts _$PostsFromJson(Map<String, dynamic> json) => Posts(
      (json['results'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostsToJson(Posts instance) => <String, dynamic>{
      'results': instance.results,
    };
