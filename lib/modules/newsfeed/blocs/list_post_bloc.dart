import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/newsfeed/repo/newsfeed_repo.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';

class ListPostsBloc extends Bloc<String, ListPostsState> {
  //String: event nhận vào
  //ListPostsState : state để cập nhật UI

  //mac dinh khoi tao ban dau la null
  ListPostsBloc() : super(ListPostsState()) {
    //event: gia tri truyen vao
    //emit: callback emit
    on((event, emit) async {
      switch (event) {
        case 'getPosts':
          try {
            final res = await ListPostsRepo().getPosts();
            // print(res);
            if (res != null) {
              emit(ListPostsState(posts: res));
            }
          } catch (e) {
            // ignore: avoid_print
            debugPrint('Error when call repo: $e');
            emit(ListPostsState(error: e));
          }
          break;
        default:
      }
    });
  }
}

class ListPostsState {
  final Object? error;
  final List<Post>? posts;

  ListPostsState({this.error, this.posts});
}
