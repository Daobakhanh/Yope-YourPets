import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/profile/common/profile_event.dart';
import 'package:yope_yourpet_social_networking/modules/profile/repos/profile_list_following_repo.dart';

class ProfileListFollowingBloc
    extends Bloc<ProfileEvent, ProfileListFollowingBlocState> {
  //ProfileEvent: kieu event nhận vào
  //ProfileListFollowerBlocState : state để cập nhật UI
  //mac dinh khoi tao ban dau la null
  ProfileListFollowingBloc() : super(ProfileListFollowingBlocState()) {
    //event: gia tri truyen vao
    //emit: callback emit
    on<ProfileEvent>((event, emit) async {
      switch (event.getProfileEvent) {
        case ProfileEventEnum.getListFollowing:
          try {
            final resListFollowing = await ProfileListFollowingRepo()
                .getListFollowing(event.getUserId);

            if (resListFollowing != null) {
              emit(
                ProfileListFollowingBlocState(users: resListFollowing),
              );
            }
          } catch (e) {
            // ignore: avoid_print
            debugPrint('Error when call repo: $e');
            emit(ProfileListFollowingBlocState(error: e));
          }
          break;

        default:
      }
    });
  }
}

class ProfileListFollowingBlocState {
  final Object? error;
  final List<User>? users;

  ProfileListFollowingBlocState({this.error, this.users});
}
