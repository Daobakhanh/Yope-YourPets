// import 'package:json_annotation/json_annotation.dart';
// import 'package:yope_yourpet_social_networking/common/data_type/gender.dart';
// import 'package:yope_yourpet_social_networking/common/data_type/userStatus.dart';
// import 'package:yope_yourpet_social_networking/models/avatar/avatar.dart';

// part 'user.g.dart';

// @JsonSerializable()
// class User {
//   /// The generated code assumes these values exist in JSON.
//   final String name;
//   final Gender gender;
//   final String? email;
//   final DateTime? dob; //date of birth
//   final DateTime registered;
//   final String? phone;
//   final UserStatus status;
//   final Picture? picture;

//   User(this.email, this.dob, this.phone, this.picture,
//       {required this.name,
//       required this.gender,
//       required this.registered,
//       required this.status});

//   /// Connect the generated [_$PersonFromJson] function to the `fromJson`
//   /// factory.
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

//   /// Connect the generated [_$PersonToJson] function to the `toJson` method.
//   Map<String, dynamic> toJson() => _$UserToJson(this);
// }

// @JsonSerializable()
// class Users {
//   final List<User> results;
//   Users({required this.results});
//   factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
//   Map<String, dynamic> toJson() => _$UsersToJson(this);
// }

import 'package:json_annotation/json_annotation.dart';
import 'package:yope_yourpet_social_networking/models/picture/picture.dart';

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

  User({this.id, this.username, this.firstName, this.lastName, this.avatar});

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
