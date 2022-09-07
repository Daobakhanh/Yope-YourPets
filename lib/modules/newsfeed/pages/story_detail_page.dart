import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/newsfeed/widgets/avatar_have_story_widget.dart';

class StoryDetailPage extends StatefulWidget {
  final User user;
  const StoryDetailPage({Key? key, required this.user}) : super(key: key);

  @override
  State<StoryDetailPage> createState() => _StoryDetailPageState();
}

class _StoryDetailPageState extends State<StoryDetailPage> {
  User get user => widget.user;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthOfScreen = size.width;
    final heightOfScreen = size.height;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: heightOfScreen,
          width: widthOfScreen,
          child: Stack(
            children: [
              SizedBox(
                // height: heightOfScreen,
                // width: widthOfScreen,
                child: Image.network(
                  user.avatar!.url!,
                  fit: BoxFit.cover,
                  height: heightOfScreen,
                  width: widthOfScreen,
                  alignment: Alignment.center,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: SizedBox(
                  width: widthOfScreen,
                  // color: Colors.green,
                  child: StoryUserInfor(
                    user: user,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
