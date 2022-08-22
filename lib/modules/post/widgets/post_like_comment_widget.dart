import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/post/pages/post_detail_page.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/stateless_widget/space_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';

class InteractivePostBar extends StatefulWidget {
  final Post post;
  const InteractivePostBar({Key? key, required this.post}) : super(key: key);

  @override
  State<InteractivePostBar> createState() => _InteractivePostBarState();
}

class _InteractivePostBarState extends State<InteractivePostBar> {
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
