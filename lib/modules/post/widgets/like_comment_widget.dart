import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/profile/widgets/personal_profile_widget.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/stateless_widget/space_widget.dart';

class InteractivePostBar extends StatelessWidget {
  final Post post;
  const InteractivePostBar({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int likeCounts = post.likeCounts;
    final int commentCounts = post.commentCounts;
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
                child: const Icon(UniconsLine.heart),
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
                },
                child: const Icon(UniconsLine.comment),
              ),
              const SizeBox5W(),
              InkWell(
                onTap: (() {
                  debugPrint('Tap to comment detail');
                }),
                child: Text('$commentCounts'),
              ),
            ],
          ),
          // Text('2im.daokhanh, khoinghiem, other')
        ],
      ),
    );
  }
}
