import 'package:json_annotation/json_annotation.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  /// The generated code assumes these values exist in JSON.
  // final String id;
  final String? id;
  final int? status;
  final String title;
  final String description;
  final List<String> photos;
  final int commentCounts;
  final int likeCounts;
  final bool liked;
  final User user; //user create post

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.

  Post({
    this.id,
    this.status,
    required this.title,
    required this.description,
    required this.photos,
    required this.commentCounts,
    required this.likeCounts,
    required this.liked,
    required this.user,
  });

  /// factory.
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
