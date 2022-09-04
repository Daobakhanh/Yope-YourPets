import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/post/common/post_detail_event.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/comment.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/post/repo/post_detail_repo.dart';
import 'package:yope_yourpet_social_networking/modules/post/repo/post_list_comment_repo.dart';
import 'package:yope_yourpet_social_networking/modules/profile/common/profile_event.dart';

class PostDetailBloc extends Bloc<PostDetailEventClass, PostDetailBlocState> {
  //String: event nhận vào
  //ListPostsState : state để cập nhật UI
  //mac dinh khoi tao ban dau la null
  PostDetailBloc() : super(PostDetailBlocState()) {
    //event: gia tri truyen vao
    //emit: callback emit
    on<PostDetailEventClass>((event, emit) async {
      switch (event.postDetailEvent) {
        case PostDetailEvent.getPostDetail:
          try {
            final resPostDetail =
                await PostDetailRepo().getPostDetail(postId: event.getPostID);
            final resPostListComment = await ListUserCommentRepo()
                .getListUserCommentPost(postId: event.getPostID);
            if (resPostDetail != null) {
              emit(PostDetailBlocState(
                  post: resPostDetail, comments: resPostListComment));
            }
          } catch (e) {
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
