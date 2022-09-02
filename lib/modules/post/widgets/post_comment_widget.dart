import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/auth/widgets/auth_common_widgets.dart';
import 'package:yope_yourpet_social_networking/modules/post/bloc/post_like_comment_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/comment.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/statefull_widget/avatar_widgets.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/stateless_widget/space_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';
import 'package:yope_yourpet_social_networking/utils/date_time_parse.dart';

class CommentBar extends StatefulWidget {
  const CommentBar({Key? key}) : super(key: key);

  @override
  State<CommentBar> createState() => _CommentBarState();
}

class _CommentBarState extends State<CommentBar> {
  @override
  Widget build(BuildContext context) {
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: scaffoldBackgroundColor,
      // color: AppColor.pinkAccent,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width - 80,
            child: const TextInput(
              label: 'Comment...',
              // height: 50,
            ),
          ),
          const SizeBox10W(),
          InkWell(
            onTap: () {
              debugPrint('Tap send comment');
              FocusScope.of(context).unfocus();
            },
            child: const Icon(Icons.send),
          )
        ],
      ),
    );
  }
}

class UserCommentWidget extends StatefulWidget {
  final String postId;
  final Comment comment;
  const UserCommentWidget(
      {Key? key, required this.comment, required this.postId})
      : super(key: key);

  @override
  State<UserCommentWidget> createState() => _UserCommentWidgetState();
}

class _UserCommentWidgetState extends State<UserCommentWidget> {
  bool isLikedComment = false;
  Comment get comment => widget.comment;
  String get postId => widget.postId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLikedComment = comment.liked!;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        //comment debug
                        child: CustomAvatar(
                          size: const Size(40, 40),
                          picture: comment.user!.avatar!.url!,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.comment.user!.displayName,
                            style: AppTextStyle.body17.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            dateTimeDetect(comment.createdAt.toString()),
                            style: AppTextStyle.caption13.copyWith(
                              color: AppTextColor.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizeBox10H(),
              SizedBox(
                width: size.width - 100,
                child: Text('${widget.comment.content}'),
              )
            ],
          ),
          InkWell(
            onTap: () {
              debugPrint('Tap to React comment');
              setState(() {
                isLikedComment = !isLikedComment;
              });
              _handleLikeComment(isLikedComment);
            },
            child: Icon(
              isLikedComment ? Icons.favorite : Icons.favorite_border,
              // color: widget.comment.liked == true ? AppColor.pinkAccent : null,
              color: isLikedComment == true ? AppColor.pinkAccent : null,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _handleLikeComment(bool isLikedComment) async {
    !isLikedComment
        ? await LikeCommentBloc.unlikeCommentEvent(postId, comment.id)
        : await LikeCommentBloc.likeCommentEvent(postId, comment.id);
  }
}
