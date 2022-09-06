import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/profile/common/profile_event.dart';
import 'package:yope_yourpet_social_networking/modules/profile/repos/personal_profile_repo.dart';
import 'package:yope_yourpet_social_networking/modules/profile/repos/profile_list_follower_repo.dart';
import 'package:yope_yourpet_social_networking/modules/profile/repos/profile_list_post_by_user_repo.dart';

class ProfileListFollowerBloc
    extends Bloc<ProfileEvent, ProfileListFollowerBlocState> {
  //ProfileEvent: kieu event nhận vào
  //ProfileListFollowerBlocState : state để cập nhật UI
  //mac dinh khoi tao ban dau la null
  ProfileListFollowerBloc() : super(ProfileListFollowerBlocState()) {
    //event: gia tri truyen vao
    //emit: callback emit
    on<ProfileEvent>((event, emit) async {
      switch (event.getProfileEvent) {
        case ProfileEventEnum.getListFollower:
          try {
            final resListFollower = await ProfileListFollowerRepo()
                .getListFollower(event.getUserId);

            if (resListFollower != null) {
              emit(
                ProfileListFollowerBlocState(users: resListFollower),
              );
            }
          } catch (e) {
            // ignore: avoid_print
            debugPrint('Error when call repo: $e');
            emit(ProfileListFollowerBlocState(error: e));
          }
          break;
        // case ProfileEventEnum.getListFollowing:
        //   try {
        //     final resListFollowing =
        //         await PersonalProfileRepo().getUserDetailById(event.getUserId);

        //     // print(res);
        //     if (resListFollowing != null) {
        //       emit(ProfileListFollowerBlocState(users: resListFollowing));
        //     }
        //   } catch (e) {
        //     // ignore: avoid_print
        //     debugPrint('Error when call repo: $e');
        //     emit(ProfileListFollowerBlocState(error: e));
        //   }
        //   break;
        default:
      }
    });
  }
}

class ProfileListFollowerBlocState {
  final Object? error;
  final List<User>? users;

  ProfileListFollowerBlocState({this.error, this.users});
}
