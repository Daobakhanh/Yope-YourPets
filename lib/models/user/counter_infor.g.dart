// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_infor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Counters _$CountersFromJson(Map<String, dynamic> json) => Counters(
      photos: json['photos'] as int?,
      followers: json['followers'] as int?,
      followings: json['followings'] as int?,
      likes: json['likes'] as int?,
    );

Map<String, dynamic> _$CountersToJson(Counters instance) => <String, dynamic>{
      'photos': instance.photos,
      'followers': instance.followers,
      'followings': instance.followings,
      'likes': instance.likes,
    };
