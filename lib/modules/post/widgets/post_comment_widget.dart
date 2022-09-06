import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/common/api/public.dart';
import 'package:yope_yourpet_social_networking/modules/post/bloc/post_create_comment_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/post/bloc/post_like_comment_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/comment.dart';
import 'package:yope_yourpet_social_networking/modules/profile/pages/profile_personal_page.dart';
import 'package:yope_yourpet_social_networking/modules/profile/pages/profile_user_by_id_page.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/statefull_widget/avatar_widgets.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/stateless_widget/space_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';
import 'package:yope_yourpet_social_networking/utils/date_time_parse.dart';

class CommentBar extends StatefulWidget {
  final String? postId;
  final VoidCallback? callback;
  const CommentBar({Key? key, this.postId, this.callback}) : super(key: key);
  @override
  State<CommentBar> createState() => _CommentBarState();
}

class _CommentBarState extends State<CommentBar> {
  String get postId => widget.postId!;
  String content = '';
  late TextEditingController _controller;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
            height: 70,
            width: size.width - 80,
            // child: const TextInputCustom(
            //   // onSubmitContent: ,
            //   label: 'Comment...',
            //   // height: 50,
            // ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                // ignore: unnecessary_null_in_if_null_operators
                height: 50,
                child: TextField(
                  controller: _controller,
                  onChanged: (String contentValue) {
                    content = contentValue;
                    debugPrint(content);
                    // widget.onSubmitContent!(value);
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    // prefixIcon: widget.icon,
                    labelText: 'Comment...',
                    hintText: 'Enter Comment',
                    hintStyle: const TextStyle(color: AppTextColor.grey),
                    suffixIcon: IconButton(
                      onPressed: _controller.clear,
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizeBox10W(),
          InkWell(
            onTap: () {
              debugPrint('Tap send comment');
              FocusScope.of(context).unfocus();
              _handleCreateComment(content);
              widget.callback;
              _controller.clear();
            },
            child: const Icon(Icons.send),
          )
        ],
      ),
    );
  }

  Future<void> _handleCreateComment(String content) async {
    debugPrint('Content: $content');
    await CreateCommentBloc.createCommentEvent(content, postId);
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
    // ignore: todo
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => comment.user!.id! != personalId
                          ? ProfileUserDetailPage(
                              user: comment.user!,
                            )
                          : const ProfilePersonalPage(),
                    ),
                  );
                },
                child: Row(
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
