import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/newsfeed/widgets/avatar_have_story_widget.dart';

class MessageDetailPage extends StatefulWidget {
  final User user;
  const MessageDetailPage({Key? key, required this.user}) : super(key: key);

  @override
  State<MessageDetailPage> createState() => _MessageDetailPageState();
}

class _MessageDetailPageState extends State<MessageDetailPage> {
  User get user => widget.user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightOfScreen = size.height;
    final widthOfScreen = size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.blue,
                  child: Center(child: Text('Entry ${[index]}')),
                );
              },
            ),
            Positioned(
                top: 0,
                left: 0,
                child: SizedBox(
                  width: widthOfScreen,
                  child: StoryUserInfor(
                    user: user,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
