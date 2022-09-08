import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/post/repo/post_delete_comment_repo.dart';

class DeleteCommentBloc extends BlocBase {
  // final String event;

  DeleteCommentBloc(state) : super(state);

  static Future<bool> deleteCommentEvent(String? postId, String? commentId) =>
      DeleteCommentRepo.deleteComment(postId, commentId);
}
