import 'package:json_annotation/json_annotation.dart';
import 'package:yope_yourpet_social_networking/common/data_type/gender.dart';
import 'package:yope_yourpet_social_networking/common/data_type/userStatus.dart';
import 'package:yope_yourpet_social_networking/models/avatar/avatar.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  /// The generated code assumes these values exist in JSON.
  final String name;
  final Gender gender;
  final String? email;
  final DateTime? dob; //date of birth
  final DateTime registered;
  final String? phone;
  final UserStatus status;
  final Picture? picture;

  User(this.email, this.dob, this.phone, this.picture,
      {required this.name,
      required this.gender,
      required this.registered,
      required this.status});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Users {
  final List<User> users;
  Users({required this.users});
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
