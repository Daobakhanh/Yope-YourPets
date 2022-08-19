import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/profile/widgets/personal_profile_widget.dart';

class InteractivePostBar extends StatelessWidget {
  final Post post;
  const InteractivePostBar({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: AppColor.pinkAccent,
      height: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  debugPrint('Tap to Like');
                },
                child: Icon(UniconsLine.heart),
              ),
              SizedBox(
                width: 3,
              ),
              InkWell(
                onTap: (() {
                  debugPrint('Tap to like detail');
                }),
                child: Text('90'),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  debugPrint('Tap to comment');
                },
                child: Icon(UniconsLine.comment),
              ),
              SizedBox(
                width: 3,
              ),
              InkWell(
                onTap: (() {
                  debugPrint('Tap to comment detail');
                }),
                child: Text('90'),
              ),
            ],
          ),
          // Text('2im.daokhanh, khoinghiem, other')
        ],
      ),
    );
  }
}
