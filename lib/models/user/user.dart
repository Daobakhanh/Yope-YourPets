import 'package:json_annotation/json_annotation.dart';
import 'package:yope_yourpet_social_networking/models/picture/picture.dart';
import 'package:yope_yourpet_social_networking/modules/profile/models/counter_infor.dart';
import 'package:yope_yourpet_social_networking/modules/profile/models/profile.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  @JsonKey(name: 'avatar')
  final Picture? avatar;

  @JsonKey(name: 'counters')
  final Counters? counters;

  @JsonKey(name: 'profile')
  final Profile? profile;

  User(
      {this.counters,
      this.profile,
      this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.avatar});

  String get displayFirstName => firstName ?? '';

  String get displayName => [firstName ?? '', lastName ?? ''].join(' ').trim();

  String get displayUsername => '@${username ?? ""}';

  // String get imgUrl {
  //   return avatar?.cloudUrl() ?? '';
  // }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Users {
  final List<User> results;
  Users({required this.results});
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
