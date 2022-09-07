import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/newsfeed/widgets/avatar_have_story_widget.dart';

class StoryBar extends StatelessWidget {
  final List<User>? users;
  const StoryBar({Key? key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      // color: AppColor.grey,
      height: 100,
      //to have height, bcuz Horizontal viewport was given unbounded height.
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: posts!.length,
        itemBuilder: (BuildContext context, int index) {
          return AvatarHaveStory(
            user: posts![index].user,
          );
        },
      ),
      //       PersonalCreateStory(users![0].picture!.large),
      // if want to add personal create Story
    );
  }
}
