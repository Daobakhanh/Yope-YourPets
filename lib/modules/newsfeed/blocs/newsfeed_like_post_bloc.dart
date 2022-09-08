import 'package:bloc/bloc.dart';
import 'package:yope_yourpet_social_networking/modules/newsfeed/repo/newsfeed_like_post_repo.dart';

class LikeBloc extends BlocBase {
  // final String event;

  LikeBloc(state) : super(state);

  static Future<bool> likePostEvent(String id) => LikePostRepo.likePost(id);

  static Future<bool> unlikePostEvent(String id) => LikePostRepo.unlikePost(id);
}
