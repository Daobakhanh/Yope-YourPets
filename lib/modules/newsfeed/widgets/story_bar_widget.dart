import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/newsfeed/widgets/avatar_have_story_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';

class StoryBar extends StatelessWidget {
  final List<User> users;
  const StoryBar({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      // color: AppColor.grey,
      height:
          100, //to have height, bcuz Horizontal viewport was given unbounded height.
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return AvatarHaveStory(
            user: users[index],
          );
        },
      ),
    );
  }
}