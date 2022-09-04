import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/post/common/post_list_user_like_event.dart';
import 'package:yope_yourpet_social_networking/modules/post/repo/post_list_user_like_repo.dart';

class ListUserLikePostBloc
    extends Bloc<ListUserLikePostEvent, ListUserLikePostState> {
  //String: event nhận vào
  //ListPostsState : state để cập nhật UI
  //mac dinh khoi tao ban dau la null
  ListUserLikePostBloc() : super(ListUserLikePostState()) {
    //event: gia tri truyen vao
    //emit: callback emit
    on<ListUserLikePostEvent>((event, emit) async {
      switch (event.getListUserLikePostEvent) {
        case ListUserLikePostEnum.getListUserLikePost:
          try {
            final res = await ListUserLikePostRepo()
                .getListUserLikePost(postId: event.getPostID);
            // print(res);
            if (res != null) {
              emit(ListUserLikePostState(users: res));
            }
          } catch (e) {
            // ignore: avoid_print
            debugPrint('Error when call repo: $e');
            emit(ListUserLikePostState(error: e));
          }
          break;
        default:
      }
    });
  }
}

class ListUserLikePostState {
  final Object? error;
  final List<User>? users;

  ListUserLikePostState({this.users, this.error});
}
