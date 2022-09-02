import 'package:json_annotation/json_annotation.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  /// The generated code assumes these values exist in JSON.
  // final String id;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;

  @JsonKey(name: 'status', includeIfNull: false)
  final int? status;

  @JsonKey(name: 'created_at', includeIfNull: false)
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at', includeIfNull: false)
  final DateTime? updatedAt;

  @JsonKey(name: 'content', includeIfNull: false)
  final String? content;

  @JsonKey(name: 'user', includeIfNull: false)
  final User? user;

  @JsonKey(name: 'liked', includeIfNull: false)
  final bool? liked;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.

  Comment({
    this.updatedAt,
    this.createdAt,
    this.content,
    this.id,
    this.status,
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
