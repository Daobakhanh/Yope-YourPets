// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['email'] as String?,
      json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      json['phone'] as String?,
      json['picture'] == null
          ? null
          : Picture.fromJson(json['picture'] as Map<String, dynamic>),
      name: json['name'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      registered: DateTime.parse(json['registered'] as String),
      status: $enumDecode(_$UserStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'gender': _$GenderEnumMap[instance.gender]!,
      'email': instance.email,
      'dob': instance.dob?.toIso8601String(),
      'registered': instance.registered.toIso8601String(),
      'phone': instance.phone,
      'status': _$UserStatusEnumMap[instance.status]!,
      'picture': instance.picture,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};

const _$UserStatusEnumMap = {
  UserStatus.offline: 'offline',
  UserStatus.online: 'online',
  UserStatus.private: 'private',
};

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      results: (json['results'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'results': instance.results,
    };
