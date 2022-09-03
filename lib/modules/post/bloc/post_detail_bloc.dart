import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/post/common/post_detail_event.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/comment.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/post/repo/post_detail_repo.dart';
import 'package:yope_yourpet_social_networking/modules/post/repo/post_list_comment_repo.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailBlocState> {
  //String: event nhận vào
  //ListPostsState : state để cập nhật UI
  final String postId;
  //mac dinh khoi tao ban dau la null
  PostDetailBloc({required this.postId}) : super(PostDetailBlocState()) {
    //event: gia tri truyen vao
    //emit: callback emit
    on((event, emit) async {
      switch (event) {
        case PostDetailEvent.getPostDetail:
          try {
            final resPostDetail =
                await PostDetailRepo().getPostDetail(postId: postId);
            final resPostListComment = await ListUserCommentRepo()
                .getListUserCommentPost(postId: postId);
            // print(res);
            if (resPostDetail != null) {
              emit(PostDetailBlocState(
                  post: resPostDetail, comments: resPostListComment));
            }
          } catch (e) {
            // ignore: avoid_print
            debugPrint('Error when call repo: $e');
            emit(PostDetailBlocState(error: e));
          }
          break;

        default:
      }
    });
  }
}

class PostDetailBlocState {
  final Object? error;
  final List<Comment>? comments;
  final Post? post;

  PostDetailBlocState({this.comments, this.post, this.error});
}
