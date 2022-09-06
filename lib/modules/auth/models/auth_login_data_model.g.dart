// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_login_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      accessToken: json['access_token'] as String?,
      expiresIn: json['expires_in'] as int?,
      hasUsernamePassword: json['has_username_password'] as bool?,
      isNew: json['is_new'] as bool?,
      oauthId: json['oauth_id'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('access_token', instance.accessToken);
  writeNotNull('refresh_token', instance.refreshToken);
  writeNotNull('oauth_id', instance.oauthId);
  writeNotNull('expires_in', instance.expiresIn);
  writeNotNull('is_new', instance.isNew);
  writeNotNull('has_username_password', instance.hasUsernamePassword);
  return val;
}
