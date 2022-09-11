import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/common/public/public.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/profile/common/profile_event.dart';
import 'package:yope_yourpet_social_networking/modules/profile/repos/profile_list_follower_repo.dart';
import 'package:yope_yourpet_social_networking/modules/profile/repos/profile_list_following_repo.dart';

class SearchListUserBloc extends Bloc<ProfileEvent, SearchListBlocState> {
  //ProfileEvent: kieu event nhận vào
  //ProfileListFollowerBlocState : state để cập nhật UI
  //mac dinh khoi tao ban dau la null
  SearchListUserBloc() : super(SearchListBlocState()) {
    //event: gia tri truyen vao
    //emit: callback emit
    on<ProfileEvent>((event, emit) async {
      switch (event.getProfileEvent) {
        case ProfileEventEnum.getListFollowing:
          try {
            final resListFollowing =
                await ProfileListFollowingRepo().getListFollowing(personalId!);

            final resListFollower = await ProfileListFollowerRepo()
                .getListFollower(event.getUserId);

            if (resListFollowing != null) {
              emit(
                SearchListBlocState(
                    usersFollowing: resListFollowing,
                    usersFollower: resListFollower),
              );
            }
          } catch (e) {
            // ignore: avoid_print
            debugPrint('Error when call repo: $e');
            emit(SearchListBlocState(error: e));
          }
          break;

        default:
      }
    });
  }
}

class SearchListBlocState {
  final Object? error;
  final List<User>? usersFollowing;
  final List<User>? usersFollower;

  SearchListBlocState({this.error, this.usersFollowing, this.usersFollower});
}
