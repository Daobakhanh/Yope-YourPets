import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:yope_yourpet_social_networking/modules/messages/pages/messages_page.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/post/repo/post_repo.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_container_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({Key? key}) : super(key: key);

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  late Future<Posts> posts;

  //logic scroll to top
  late ScrollController _scrollController;
  bool _showBackToTopButton = false;
  @override
  void initState() {
    super.initState();
    posts = readJsonFromAssetPost();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose(); // dispose the controller
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          InkWell(
            child: const Icon(
              Icons.add_to_photos,
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
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: FutureBuilder(
          future: Future.wait([posts]),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              final dataPosts = snapshot.data![0];
              final List<Post> posts = dataPosts.results;

              return ListView.builder(
                controller: _scrollController,
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostWidget(
                    post: posts[index],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              backgroundColor: AppColor.grey,
              onPressed: _scrollToTop,
              child: const Icon(
                Icons.arrow_upward,
                color: AppColor.light,
              ),
            ),
    );
  }
}
