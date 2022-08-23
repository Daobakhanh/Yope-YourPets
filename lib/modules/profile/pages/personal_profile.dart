import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/post/repo/post_repo.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_container_widget.dart';
import 'package:yope_yourpet_social_networking/modules/profile/pages/profile_drawer_page.dart';
import 'package:yope_yourpet_social_networking/modules/profile/repos/profile_repo.dart';
import 'package:yope_yourpet_social_networking/modules/profile/widgets/personal_profile_widget.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/statefull_widget/avatar_widgets.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/stateless_widget/button_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class PersonalProfilePage extends StatefulWidget {
  const PersonalProfilePage({Key? key}) : super(key: key);

  @override
  State<PersonalProfilePage> createState() => _PersonalProfilePageState();
}

class _PersonalProfilePageState extends State<PersonalProfilePage> {
  late Future<Users> users;
  late Future<Posts> posts;
  String name = 'My Profile';
  late ScrollController _scrollController;
  bool _showBackToTopButton = false;
  @override
  void initState() {
    super.initState();
    posts = readJsonFromAssetPost();
    users = readJsonFromUserById(); //get user by id when call real API

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
      endDrawer: const Drawer(child: PersonalProfileDrawerPage()),
      appBar: AppBar(
        // leading: InkWell(
        //   child: const Icon(Icons.arrow_back),
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: Text(
          name,
        ),
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              backgroundColor: AppColor.grey,
              onPressed: _scrollToTop,
              child: const Icon(Icons.arrow_upward, color: AppColor.light),
            ),
      body: FutureBuilder(
        future: Future.wait([users, posts]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            final dataUsers = snapshot.data![0];
            final dataPosts = snapshot.data![1];
            final List<User> users = dataUsers.results;
            final List<Post> posts = dataPosts.results;

            return PersonalProfileFutureBuilder(
              posts: posts,
              user: users[0],
              controller: _scrollController,
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator());
        },
      ),
    );
  }
}

class PersonalProfileFutureBuilder extends StatefulWidget {
  final User user;
  final List<Post> posts;
  final ScrollController? controller;

  const PersonalProfileFutureBuilder(
      {Key? key, required this.user, required this.posts, this.controller})
      : super(key: key);

  @override
  State<PersonalProfileFutureBuilder> createState() =>
      _PersonalProfileFutureBuilderState();
}

class _PersonalProfileFutureBuilderState
    extends State<PersonalProfileFutureBuilder> {
  bool hideBio = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.controller,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAvatar(
                picture: widget.user.picture!.large,
                size: const Size(80, 80),
              ),
              Row(
                children: const [
                  InforNumberProfile(number: 54, title: 'Posts'),
                  InforNumberProfile(number: 400, title: 'Followers'),
                  InforNumberProfile(number: 540, title: 'Following'),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user.name,
                style: AppTextStyle.body20.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              //username
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 7),
                child: Text('@2im.daokhanhBK'),
              ),

              Text(
                'As conscious traveling Paupers we must always be concerned about our dear Mother Earth. If you think about it, you travel across her face, and She is the host to your journey; without Her we could not find the unfolding adventures that attract and feed',
                maxLines: hideBio ? 2 : 10,
                overflow: hideBio ? TextOverflow.ellipsis : TextOverflow.clip,
              ),
              // TextButton(onPressed: () {}, child: Text("more")),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                child: Text(
                  hideBio ? "more" : "hide",
                  style: const TextStyle(
                      fontStyle: FontStyle.italic, color: AppTextColor.grey),
                ),
                onTap: () {
                  debugPrint('hello');
                  setState(() {
                    hideBio = !hideBio;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              LongRectangleButton(
                nameOfButton: 'Edit profile',
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          height: 1,
        ),
        Column(
          children: List<Widget>.generate(widget.posts.length, (index) {
            return PostWidget(
              post: widget.posts[index],
            );
          }),
        )
      ],
    );
  }
}
