import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';
import 'package:yope_yourpet_social_networking/modules/messages/pages/messages_home_page.dart';
import 'package:yope_yourpet_social_networking/modules/newsfeed/blocs/newsfeed_list_posts_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/newsfeed/widgets/story_bar_widget.dart';
import 'package:yope_yourpet_social_networking/modules/post/pages/post_create_post_page.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_container_widget.dart';
import 'package:yope_yourpet_social_networking/modules/widget/widgets/stateless_widget/space_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({Key? key}) : super(key: key);

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  // late Future<Posts> posts;
  // late Future<Users> users;

  //logic scroll to top
  late ScrollController _scrollController;
  bool _showBackToTopButton = false;

  final _listPostBloc = ListPostsBloc();

  @override
  void initState() {
    super.initState();
    _listPostBloc.add('getPosts');

    // Handle mock api data
    // posts = readJsonFromAssetPost();
    // users = readJsonFromUsersStory();

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const PostCreatePage()),
                ),
              );
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
      body: BlocBuilder<ListPostsBloc, ListPostsBlocState>(
        bloc: _listPostBloc,
        builder: (context, state) {
          final posts = state.posts;
          final users = state.users;
          final error = state.error;
          if (posts != null) {
            return ListView(
              controller: _scrollController,
              children: [
                //mock users using user of posts
                StoryBar(users: users),

                // const SizeBox10H(),
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
          }
          if (error != null) {
            return Center(
              child: Text(
                error.toString(),
              ),
            );
          }
          // if (posts == null || error == null) {
          //   return const Center(
          //     child: Text(
          //       'Don\'t have state',
          //     ),
          //   );
          // }

          return const Center(
            child: CircularProgressIndicator(),
          );
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
