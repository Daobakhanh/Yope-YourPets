import 'package:bloc/bloc.dart';
import 'package:yope_yourpet_social_networking/modules/newsfeed/repo/like_post_repo.dart';

class LikeBloc extends BlocBase {
  // final String event;

  LikeBloc(state) : super(state);

  static Future<bool> like(String id) => LikePostRepo.like(id);

  static Future<bool> unlike(String id) => LikePostRepo.unlike(id);
}
