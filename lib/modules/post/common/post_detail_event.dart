enum PostDetailEvent { getPostDetail, sendComment }

class PostDetailEventClass {
  final String postId;
  final PostDetailEvent event;

  String get getPostID {
    return postId;
  }

  PostDetailEvent get postDetailEvent {
    return event;
  }

  PostDetailEventClass({required this.postId, required this.event});
}
