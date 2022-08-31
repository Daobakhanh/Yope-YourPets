// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      id: json['id'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] == null
          ? null
          : Picture.fromJson(json['image'] as Map<String, dynamic>),
      commentCounts: json['comment_counts'] as int?,
      likeCounts: json['like_counts'] as int?,
      collectionCounts: json['collection_counts'] as int?,
      viewCounts: json['view_counts'] as int?,
      isPrivate: json['is_private'] as bool?,
      isSensitive: json['is_sensitive'] as bool?,
      storageLength: json['storage_length'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      liked: json['liked'] as bool?,
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('image', instance.image);
  writeNotNull('comment_counts', instance.commentCounts);
  writeNotNull('like_counts', instance.likeCounts);
  writeNotNull('collection_counts', instance.collectionCounts);
  writeNotNull('view_counts', instance.viewCounts);
  writeNotNull('is_private', instance.isPrivate);
  writeNotNull('is_sensitive', instance.isSensitive);
  writeNotNull('storage_length', instance.storageLength);
  writeNotNull('user', instance.user);
  writeNotNull('liked', instance.liked);
  return val;
}
