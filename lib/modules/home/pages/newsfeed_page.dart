import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:yope_yourpet_social_networking/modules/messages/pages/messages_page.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({Key? key}) : super(key: key);

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          InkWell(
            child: const Icon(
              Icons.add_to_photos_rounded,
              size: 25,
            ),
            onTap: () {
              debugPrint('Home: Newfeed - press add');
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 20),
            child: InkWell(
              child: const Icon(
                UniconsLine.facebook_messenger,
                size: 25,
              ),
              onTap: () {
                debugPrint('Home: Newfeed - press message');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MessagePage()),
                );
              },
            ),
          ),
        ],
        title: Text(
          'Yope',
          style: AppTextStyle.appName.copyWith(fontSize: 35),
        ),
      ),
      body: const Text('hello'),
    );
  }
}
