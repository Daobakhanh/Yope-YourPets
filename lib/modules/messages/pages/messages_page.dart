import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/models/chat/chat.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/messages/repos/message_repo.dart';
import 'package:yope_yourpet_social_networking/modules/messages/widgets/message_widget.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  late Future<Users> users;
  late Future<Chats> chats;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    users = readJsonFromAssetUser();
    chats = readJsonFromAssetChat();
  }

  @override
  Widget build(BuildContext context) {
    // final test = data.;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_box_rounded,
              size: 30,
            ),
            onPressed: () {},
          ),
          // add more IconButton
        ],
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: const [
          //     Padding(
          //       padding: EdgeInsets.only(left: 15, top: 15, bottom: 10),
          //       child: Text(
          //         'Messages',
          //         textAlign: TextAlign.start,
          //         style: AppTextStyle.largeTitle,
          //       ),
          //     ),
          //   ],
          // ),
          FutureBuilder(
            future: Future.wait([users]),
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasData) {
                final dataUsers = snapshot.data![0];

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: HorizontalListActiveUser(dataUsers: dataUsers),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
          const Divider(
            height: 1,
            // color: AppColor.black,
            // thickness: 0.5,
          ),
          FutureBuilder(
            future: Future.wait([chats]),
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasData) {
                final dataChats = snapshot.data![0];
                return VerticalListUserWithLastMessage(
                    dataUserWithLastChat: dataChats);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
