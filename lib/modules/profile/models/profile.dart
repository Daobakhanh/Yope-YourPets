import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  @JsonKey(name: 'bio')
  final String? bio;

  @JsonKey(name: 'instagram_username')
  final String? instagramUsername;

  Profile({
    this.bio,
    this.instagramUsername,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
