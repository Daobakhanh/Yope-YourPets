import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:yope_yourpet_social_networking/modules/auth/widgets/auth_common_widgets.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/post/pages/post_detail_page.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/stateless_widget/space_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';

class InteractivePostInfor extends StatefulWidget {
  final Post post;
  const InteractivePostInfor({Key? key, required this.post}) : super(key: key);

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
    final Size size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding.left;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width - 100 - padding * 2,
          child: const TextInput(
            label: 'Comment...',
            // height: 50,
          ),
        ),
        const InkWell(
          child: Icon(Icons.send),
        )
      ],
    );
  }
}
