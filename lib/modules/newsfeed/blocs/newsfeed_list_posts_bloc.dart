import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/newsfeed/repo/newsfeed_list_posts_repo.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';

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
            // print(res);
            if (res != null) {
              emit(ListPostsBlocState(posts: res));
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

  ListPostsBlocState({this.error, this.posts});
}
