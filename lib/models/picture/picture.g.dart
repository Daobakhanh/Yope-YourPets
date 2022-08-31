// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Picture _$PictureFromJson(Map<String, dynamic> json) => Picture(
      url: json['url'] as String?,
      orgWidth: json['org_width'] as int?,
      orgHeight: json['org_height'] as int?,
      orgUrl: json['org_url'] as String?,
      cloudName: json['cloud_name'] as String?,
    );

Map<String, dynamic> _$PictureToJson(Picture instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('org_width', instance.orgWidth);
  writeNotNull('org_height', instance.orgHeight);
  writeNotNull('org_url', instance.orgUrl);
  writeNotNull('cloud_name', instance.cloudName);
  return val;
}
