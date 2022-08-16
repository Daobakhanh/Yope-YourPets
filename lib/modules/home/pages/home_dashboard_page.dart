import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/home/common/home_list_screen.dart';
import 'package:yope_yourpet_social_networking/modules/home/pages/newsfeed_page.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/statefull_widget/card_screen.dart';
// import 'package:social_network_newsfeed/common/data_type/list_screen.dart';
// import 'package:social_network_newsfeed/modules/auth/pages/login_page.dart';
// import 'package:social_network_newsfeed/modules/posts/pages/list_posts_page.dart';

// import '../../common_widget/pages/common_widget_page.dart';
// import '../../messages/pages/message_page.dart';

class DashBoardHomePage extends StatelessWidget {
  const DashBoardHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Dashboard'),
      ),
      body: ListView(
        children: [
          CardScreen(
            title: listHomeDashBoardScreen[0],
            pageWidget: const NewsFeedPage(),
          ),
          CardScreen(
            title: listHomeDashBoardScreen[1],
            pageWidget: const NewsFeedPage(),
          ),
        ],
      ),
    );
  }
}
