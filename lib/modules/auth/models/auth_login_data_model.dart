import 'package:json_annotation/json_annotation.dart';

part 'auth_login_data_model.g.dart';

@JsonSerializable()
class LoginData {
  /// The generated code assumes these values exist in JSON.
  // final String id;
  @JsonKey(name: 'access_token', includeIfNull: false)
  final String? accessToken;

  @JsonKey(name: 'refresh_token', includeIfNull: false)
  final String? refreshToken;

  @JsonKey(name: 'oauth_id', includeIfNull: false)
  final String? oauthId;

  @JsonKey(name: 'expires_in', includeIfNull: false)
  final int? expiresIn;

  @JsonKey(name: 'is_new', includeIfNull: false)
  final bool? isNew;

  @JsonKey(name: 'has_username_password', includeIfNull: false)
  final bool? hasUsernamePassword;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.

  String get getAccessToken => accessToken!;

  LoginData(
      {this.accessToken,
      this.expiresIn,
      this.hasUsernamePassword,
      this.isNew,
      this.oauthId,
      this.refreshToken});

  /// factory.
  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
