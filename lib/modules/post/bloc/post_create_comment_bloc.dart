import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/post/repo/post_create_comment_repo.dart';
import 'package:yope_yourpet_social_networking/modules/post/repo/post_like_comment_repo.dart';

class CreateCommentBloc extends BlocBase {
  // final String event;

  CreateCommentBloc(state) : super(state);

  static Future<bool> createCommentEvent(String? content, String? postId) =>
      CreateCommentRepo.submitCommentToServer(content, postId);
}
