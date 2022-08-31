import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/messages/pages/messages_page.dart';
import 'package:yope_yourpet_social_networking/modules/newsfeed/repo/newsfeed_repo.dart';
import 'package:yope_yourpet_social_networking/modules/newsfeed/widgets/story_bar_widget.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/post/repo/post_detail_repo.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_container_widget.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/stateless_widget/space_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({Key? key}) : super(key: key);

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  late Future<Posts> posts;
  late Future<Users> users;

  //logic scroll to top
  late ScrollController _scrollController;
  bool _showBackToTopButton = false;
  @override
  void initState() {
    super.initState();
    posts = readJsonFromAssetPost();
    users = readJsonFromUsersStory();

    //scroll to top handler
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
      body: FutureBuilder(
        future: Future.wait([posts, users]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            final dataPosts = snapshot.data[0];
            final dataUsersStory = snapshot.data[1];
            final List<Post> posts = dataPosts.results;
            final List<User> usersStory = dataUsersStory.results;

            return ListView(
              controller: _scrollController,
              children: [
                StoryBar(users: usersStory),
                const Divider(
                  height: 1,
                ),
                const SizeBox10H(),
                Column(
                  children: List<Widget>.generate(posts.length, (index) {
                    return PostWidget(
                      post: posts[index],
                    );
                  }),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator());
        },
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
