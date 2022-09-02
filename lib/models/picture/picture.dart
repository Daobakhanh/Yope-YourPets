// import 'package:json_annotation/json_annotation.dart';

// part 'avatar.g.dart';

// @JsonSerializable()
// class Picture {
//   /// The generated code assumes these values exist in JSON.
//   final String large;
//   final String medium;
//   final String thumbnail;

//   /// The generated code below handles if the corresponding JSON value doesn't
//   /// exist or is empty.

//   Picture(
//     this.large,
//     this.medium,
//     this.thumbnail,
//   );

//   /// Connect the generated [_$PersonFromJson] function to the `fromJson`
//   /// factory.
//   factory Picture.fromJson(Map<String, dynamic> json) =>
//       _$PictureFromJson(json);

//   /// Connect the generated [_$PersonToJson] function to the `toJson` method.
//   Map<String, dynamic> toJson() => _$PictureToJson(this);
// }

import 'package:json_annotation/json_annotation.dart';

part 'picture.g.dart';

@JsonSerializable()
class Picture {
  @JsonKey(name: 'url', includeIfNull: false)
  final String? url;

  @JsonKey(name: 'org_width', includeIfNull: false)
  final int? orgWidth;

  @JsonKey(name: 'org_height', includeIfNull: false)
  final int? orgHeight;

  @JsonKey(name: 'org_url', includeIfNull: false)
  final String? orgUrl;

  @JsonKey(name: 'cloud_name', includeIfNull: false)
  final String? cloudName;

  Picture(
      {this.url, this.orgWidth, this.orgHeight, this.orgUrl, this.cloudName});

  // String fullSizeUrl({int maxSize = 2048}) {
  //   return (orgHeight > 2048) ? '$url?h=$maxSize' : url;
  // }
  //

  // String cloudUrl([int w = 100, int h = 100]) {
  //   final userAvtUrl = url ?? '';
  //   if (userAvtUrl.startsWith('https://dofhunt.imgix.net')) {
  //     return PhotoUtils.genImgIx(userAvtUrl, w, h, focusFace: true);
  //   }

  //   if (userAvtUrl.startsWith('https://graph.facebook.com')) {
  //     return PhotoUtils.genFbImg(userAvtUrl, 100, 100);
  //   }

  //   return userAvtUrl;
  // }

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);

  Map<String, dynamic> toJson() => _$PictureToJson(this);
}
