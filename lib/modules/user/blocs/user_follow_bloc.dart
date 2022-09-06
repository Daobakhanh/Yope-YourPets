import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/user/repo/user_follow_repo.dart';

class UserFollowBloc extends BlocBase {
  UserFollowBloc(state) : super(state);

  static Future<bool> followUserEvent(String? userId) =>
      FollowUserRepo.followUser(userId);

  static Future<bool> unlikeCommentEvent(String? userId) =>
      FollowUserRepo.unFollowUser(
        userId,
      );
}
