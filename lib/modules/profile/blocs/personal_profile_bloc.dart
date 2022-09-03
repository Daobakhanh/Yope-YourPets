import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/newsfeed/repo/list_posts_repo.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/profile/common/profile_event.dart';
import 'package:yope_yourpet_social_networking/modules/profile/repos/personal_profile_repo.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileBlocState> {
  //String: event nhận vào
  //ListPostsState : state để cập nhật UI
  final String? userId;
  //mac dinh khoi tao ban dau la null
  ProfileBloc({this.userId}) : super(ProfileBlocState()) {
    //event: gia tri truyen vao
    //emit: callback emit
    on((event, emit) async {
      switch (event) {
        case ProfileEvent.getPersonalProfile:
          try {
            final res = await PersonalProfileRepo().getPersonalProfile();
            // print(res);
            if (res != null) {
              emit(ProfileBlocState(user: res));
            }
          } catch (e) {
            // ignore: avoid_print
            debugPrint('Error when call repo: $e');
            emit(ProfileBlocState(error: e));
          }
          break;
        case ProfileEvent.getUserDetailById:
          try {
            final res = await PersonalProfileRepo().getUserDetailById(userId!);
            // print(res);
            if (res != null) {
              emit(ProfileBlocState(user: res));
            }
          } catch (e) {
            // ignore: avoid_print
            debugPrint('Error when call repo: $e');
            emit(ProfileBlocState(error: e));
          }
          break;
        default:
      }
    });
  }
}

class ProfileBlocState {
  final Object? error;
  final User? user;

  ProfileBlocState({this.error, this.user});
}
