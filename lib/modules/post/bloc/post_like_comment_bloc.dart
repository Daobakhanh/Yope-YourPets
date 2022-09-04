import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/post/repo/post_like_comment_repo.dart';

class LikeCommentBloc extends BlocBase {
  // final String event;

  LikeCommentBloc(state) : super(state);

  static Future<bool> likeCommentEvent(String? postId, String? commentId) =>
      LikeCommentRepo.likeComment(postId, commentId);

  static Future<bool> unlikeCommentEvent(String? postId, String? commentId) =>
      LikeCommentRepo.unlikeComment(postId, commentId);
}
