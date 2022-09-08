import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/messages/widgets/message_interactive_widget.dart';
import 'package:yope_yourpet_social_networking/modules/widget/widgets/statefull_widget/avatar_widgets.dart';
import 'package:yope_yourpet_social_networking/modules/widget/widgets/stateless_widget/space_widget.dart';

class MessageDetailPage extends StatefulWidget {
  final User user;
  const MessageDetailPage({Key? key, required this.user}) : super(key: key);

  @override
  State<MessageDetailPage> createState() => _MessageDetailPageState();
}

class _MessageDetailPageState extends State<MessageDetailPage> {
  User get user => widget.user;
  String content = '';
  late TextEditingController _controller;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    // final heightOfScreen = size.height;
    // final widthOfScreen = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAvatar(
              // radius: 1,
              picture: user.avatar!.url!,
              size: const Size(30, 30),
            ),
            const SizeBox15W(),
            Text(user.displayName),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(Icons.call),
          ),
          const SizeBox15W(),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.video_call,
              size: 30,
            ),
          ),
          const SizeBox15W()
        ],
      ),
      body: Stack(
        children: [
          // ListView.builder(
          //   itemCount: 20,
          //   itemBuilder: (BuildContext context, int index) {
          //     return Container(
          //       alignment: Alignment.center,
          //       padding: const EdgeInsets.only(top: 10),
          //       height: 60,
          //       child: Container(
          //         color: Colors.blue,
          //         child: Text(
          //           'UserName: ${user.displayName}',
          //         ),
          //       ),
          //     );
          //   },
          // ),
          Positioned(
              bottom: 10,
              // left: 0,
              // child: Container(
              //   color: Theme.of(context).backgroundColor.withOpacity(0.8),
              //   width: widthOfScreen,
              //   child: const MessageInteractiveWidget(),
              // ),
              child: MessageTextInputBar(
                userId: user.id,
              ))
        ],
      ),
    );
  }
}
