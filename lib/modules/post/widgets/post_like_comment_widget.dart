import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:yope_yourpet_social_networking/modules/auth/widgets/auth_common_widgets.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/comment.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/post/pages/post_detail_page.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/statefull_widget/avatar_widgets.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/stateless_widget/space_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class InteractivePostInfor extends StatefulWidget {
  final bool? isInPostDetail;
  final Post post;
  const InteractivePostInfor(
      {Key? key, required this.post, this.isInPostDetail})
      : super(key: key);

  @override
  State<InteractivePostInfor> createState() => _InteractivePostInforState();
}

class _InteractivePostInforState extends State<InteractivePostInfor> {
  bool saved = false;
  @override
  Widget build(BuildContext context) {
    final int likeCounts = widget.post.likeCounts;
    final int commentCounts = widget.post.commentCounts;
    return SizedBox(
      // color: AppColor.pinkAccent,
      height: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const SizeBox5W(),
              InkWell(
                onTap: () {
                  debugPrint('Tap to Like');
                },
                child: Icon(
                  widget.post.liked ? Icons.favorite : Icons.favorite_border,
                  color: widget.post.liked ? AppColor.pinkAccent : null,
                ),
              ),
              const SizeBox5W(),
              InkWell(
                onTap: (() {
                  debugPrint('Tap to like detail');
                }),
                child: Text('$likeCounts'),
              ),
              const SizeBox20W(),
              InkWell(
                onTap: () {
                  debugPrint('Tap to comment');
                  widget.isInPostDetail ??
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostDetailPage(
                                  post: widget.post,
                                )),
                      );
                },
                child: Row(
                  children: [
                    const Icon(UniconsLine.comment),
                    const SizeBox5W(),
                    Text('$commentCounts')
                  ],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              debugPrint('Tap to save');
              setState(() {
                saved = !saved;
              });
            },
            child: Icon(
              saved ? Icons.bookmark : Icons.bookmark_border,
              color: saved ? AppColor.grey : null,
            ),
          ),
        ],
      ),
    );
  }
}

class CommentBar extends StatelessWidget {
  const CommentBar({Key? key}) : super(key: key);

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
  final Comment comment;
  const UserCommentWidget({Key? key, required this.comment}) : super(key: key);

  @override
  State<UserCommentWidget> createState() => _UserCommentWidgetState();
}

class _UserCommentWidgetState extends State<UserCommentWidget> {
  bool isLikedComment = false;

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
                        child: CustomAvatar(
                          size: const Size(40, 40),
                          picture: widget.comment.user!.picture!.medium,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.comment.user!.name,
                            style: AppTextStyle.body17.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '2 hour ago',
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
              debugPrint('Tap to like comment');
              setState(() {
                isLikedComment = !isLikedComment;
              });
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
}
