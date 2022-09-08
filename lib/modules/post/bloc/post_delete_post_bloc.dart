import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/post/repo/post_delete_post_repo.dart';

class DeletePostBloc extends BlocBase {
  DeletePostBloc(state) : super(state);

  static Future<bool> deletePostEvent(String? postId) =>
      DeletePostRepo.deletePost(
        postId,
      );
}
