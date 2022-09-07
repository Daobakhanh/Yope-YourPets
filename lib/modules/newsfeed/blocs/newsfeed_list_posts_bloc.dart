import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/newsfeed/repo/newsfeed_list_posts_repo.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/profile/repos/profile_list_follower_repo.dart';
import 'package:yope_yourpet_social_networking/modules/profile/repos/profile_list_following_repo.dart';

class ListPostsBloc extends Bloc<String, ListPostsBlocState> {
  //String: event nhận vào
  //ListPostsState : state để cập nhật UI

  //mac dinh khoi tao ban dau la null
  ListPostsBloc() : super(ListPostsBlocState()) {
    //event: gia tri truyen vao
    //emit: callback emit
    on((event, emit) async {
      switch (event) {
        case 'getPosts':
          try {
            final res = await ListPostsRepo().getPosts();
            final resListUser = await ProfileListFollowingRepo()
                .getListFollowing("56n4Zd29o34RaogrrW");
            // print(res);
            if (res != null) {
              emit(ListPostsBlocState(posts: res, users: resListUser));
            }
          } catch (e) {
            // ignore: avoid_print
            debugPrint('Error when call repo: $e');
            emit(ListPostsBlocState(error: e));
          }
          break;
        default:
      }
    });
  }
}

class ListPostsBlocState {
  final Object? error;
  final List<Post>? posts;
  final List<User>? users;

  ListPostsBlocState({this.error, this.posts, this.users});
}
