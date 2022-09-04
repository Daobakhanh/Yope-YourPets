enum ListUserLikePostEnum { getListUserLikePost }

class ListUserLikePostEvent {
  final String postId;
  final ListUserLikePostEnum event;

  ListUserLikePostEvent({required this.postId, required this.event});

  String get getPostID {
    return postId;
  }

  ListUserLikePostEnum get getListUserLikePostEvent {
    return event;
  }
}
