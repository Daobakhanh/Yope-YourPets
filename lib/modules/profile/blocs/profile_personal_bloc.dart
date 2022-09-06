import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/profile/common/profile_event.dart';
import 'package:yope_yourpet_social_networking/modules/profile/repos/profile_personal_repo.dart';
import 'package:yope_yourpet_social_networking/modules/profile/repos/profile_list_post_by_user_repo.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileBlocState> {
  //String: event nhận vào
  //ListPostsState : state để cập nhật UI
  //mac dinh khoi tao ban dau la null
  ProfileBloc() : super(ProfileBlocState()) {
    //event: gia tri truyen vao
    //emit: callback emit
    on<ProfileEvent>((event, emit) async {
      switch (event.getProfileEvent) {
        case ProfileEventEnum.getPersonalProfile:
          try {
            final resPersonalProfile =
                await PersonalProfileRepo().getPersonalProfile();
            final resListPost =
                await ListPostsByUserIdRepo().getPostsOfUserId(event.getUserId);
            // print(res);
            if (resPersonalProfile != null && resListPost != null) {
              emit(
                ProfileBlocState(user: resPersonalProfile, posts: resListPost),
              );
            }
          } catch (e) {
            // ignore: avoid_print
            debugPrint('Error when call repo: $e');
            emit(ProfileBlocState(error: e));
          }
          break;
        case ProfileEventEnum.getUserDetailById:
          try {
            final res =
                await PersonalProfileRepo().getUserDetailById(event.getUserId);
            final resListPost =
                await ListPostsByUserIdRepo().getPostsOfUserId(event.getUserId);

            // print(res);
            if (res != null) {
              emit(ProfileBlocState(user: res, posts: resListPost));
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
  final List<Post>? posts;

  ProfileBlocState({this.error, this.user, this.posts});
}
