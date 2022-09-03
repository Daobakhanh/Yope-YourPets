import 'package:json_annotation/json_annotation.dart';
import 'package:yope_yourpet_social_networking/models/picture/picture.dart';

part 'counter_infor.g.dart';

@JsonSerializable()
class Counters {
  @JsonKey(name: 'photos')
  final int? photos;

  @JsonKey(name: 'followers')
  final int? followers;

  @JsonKey(name: 'followings')
  final int? followings;

  @JsonKey(name: 'likes')
  final int? likes;

  Counters({
    this.photos,
    this.followers,
    this.followings,
    this.likes,
  });

  factory Counters.fromJson(Map<String, dynamic> json) =>
      _$CountersFromJson(json);

  Map<String, dynamic> toJson() => _$CountersToJson(this);
}
