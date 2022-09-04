// import 'package:json_annotation/json_annotation.dart';
// import 'package:yope_yourpet_social_networking/models/user/user.dart';

// part 'post.g.dart';

// @JsonSerializable()
// class Post {
//   /// The generated code assumes these values exist in JSON.
//   // final String id;
//   final String? id;
//   final int? status;
//   final String title;
//   final String description;
//   final List<String> photos;
//   final int commentCounts;
//   final int likeCounts;
//   final bool liked;
//   final User user; //user create post

//   /// The generated code below handles if the corresponding JSON value doesn't
//   /// exist or is empty.

//   Post({
//     this.id,
//     this.status,
//     required this.title,
//     required this.description,
//     required this.photos,
//     required this.commentCounts,
//     required this.likeCounts,
//     required this.liked,
//     required this.user,
//   });

//   /// factory.
//   factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

//   Map<String, dynamic> toJson() => _$PostToJson(this);
// }

// @JsonSerializable()
// class Posts {
//   final List<Post> results;
//   Posts(this.results);

//   factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);
//   Map<String, dynamic> toJson() => _$PostsToJson(this);
// }

import 'package:json_annotation/json_annotation.dart';
import 'package:yope_yourpet_social_networking/models/picture/picture.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/photo.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;

  @JsonKey(name: 'status', includeIfNull: false)
  final int? status;

  @JsonKey(name: 'title', includeIfNull: false)
  final String? title;

  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;

  @JsonKey(name: 'images', includeIfNull: false)
  final List<Picture>? images;

  @JsonKey(name: 'photos', includeIfNull: false)
  final List<Photo>? photos;

  @JsonKey(name: 'comment_counts', includeIfNull: false)
  final int? commentCounts;

  @JsonKey(name: 'like_counts', includeIfNull: false)
  int? likeCounts;

  @JsonKey(name: 'liked', includeIfNull: false)
  bool? liked;

  @JsonKey(name: 'user', includeIfNull: false)
  final User? user;

  @JsonKey(name: 'created_at', includeIfNull: false)
  final DateTime? createdAt;

  Post({
    this.createdAt,
    this.id,
    this.status,
    this.title,
    this.description,
    this.images,
    this.photos,
    this.commentCounts,
    this.likeCounts,
    this.liked,
    this.user,
  });

  // String? get urlUserAvatar => user?.imgUrl;
  //set size with widget

  // String get displayName => user?.displayName ?? '';

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable()
class Posts {
  final List<Post> results;
  Posts(this.results);

  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);
  Map<String, dynamic> toJson() => _$PostsToJson(this);
}
