import 'package:json_annotation/json_annotation.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  /// The generated code assumes these values exist in JSON.
  // final String id;
  final String? id;
  final int? status;
  final DateTime? createdAt;
  final String? content;
  final bool? liked;
  final int? likeCounts;
  final User? user; //user create post

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.

  Comment({
    this.createdAt,
    this.content,
    this.id,
    this.status,
    this.likeCounts,
    this.liked,
    this.user,
  });

  /// factory.
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}

@JsonSerializable()
class Comments {
  final List<Comment> results;
  Comments(this.results);

  factory Comments.fromJson(Map<String, dynamic> json) =>
      _$CommentsFromJson(json);
  Map<String, dynamic> toJson() => _$CommentsToJson(this);
}
