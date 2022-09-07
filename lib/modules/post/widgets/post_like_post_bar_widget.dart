import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:yope_yourpet_social_networking/modules/newsfeed/blocs/newsfeed_like_post_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/post/pages/post_detail_page.dart';
import 'package:yope_yourpet_social_networking/modules/post/pages/post_user_like_detail_page.dart';
import 'package:yope_yourpet_social_networking/modules/widget/widgets/stateless_widget/space_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class InteractivePostInfor extends StatefulWidget {
  final bool? isInPostDetail;
  final Post? post;
  const InteractivePostInfor(
      {Key? key, required this.post, this.isInPostDetail})
      : super(key: key);

  @override
  State<InteractivePostInfor> createState() => _InteractivePostInforState();
}

class _InteractivePostInforState extends State<InteractivePostInfor> {
  Post get post => widget.post!;
  bool saved = false;
  bool isLiked = false;
  int likeCount = 0;
  int commentCounts = 0;
  // int get commentCounts => post.commentCounts ?? 0;

  @override
  void initState() {
    super.initState();

    likeCount = post.likeCounts ?? 0;
    commentCounts = post.commentCounts ?? 0;
    isLiked = post.liked ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
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
                      debugPrint('Tap to Like/Unlike');
                      setState(() {
                        isLiked = !isLiked;
                        likeCount = isLiked ? likeCount + 1 : likeCount - 1;
                      });
                      _handleLikePost(isLiked);
                    },
                    child: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? AppColor.pinkAccent : null,
                    ),
                  ),
                  const SizeBox5W(),
                  InkWell(
                    onTap: (() {
                      debugPrint('Tap to like detail');
                    }),
                    child: Text('$likeCount'),
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
                                      postId: widget.post!.id,
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
        ),
        const SizeBox5H(),
        likeCount != 0
            ? GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PostLikeDetailPage(
                              postId: widget.post!.id,
                            )),
                  );
                },
                child: Text(
                  '$likeCount likes',
                  style: AppTextStyle.caption13
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              )
            : const SizeBox5H()
      ],
    );
  }

  Future<void> _handleLikePost(bool isLiked) async {
    !isLiked ? await LikeBloc.unlike(post.id!) : await LikeBloc.like(post.id!);
  }
}
