import 'package:json_annotation/json_annotation.dart';

part 'avatar.g.dart';

@JsonSerializable()
class Picture {
  /// The generated code assumes these values exist in JSON.
  final String large;
  final String medium;
  final String thumbnail;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.

  Picture(
    this.large,
    this.medium,
    this.thumbnail,
  );

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PictureToJson(this);
}
