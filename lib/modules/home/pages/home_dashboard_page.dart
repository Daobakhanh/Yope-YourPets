import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/home/common/home_list_screen.dart';
import 'package:yope_yourpet_social_networking/modules/home/pages/newsfeed_page.dart';
import 'package:yope_yourpet_social_networking/modules/messages/pages/messages_page.dart';
import 'package:yope_yourpet_social_networking/modules/navigation/pages/app_navigation.dart';
import 'package:yope_yourpet_social_networking/modules/profile/pages/personal_profile.dart';
import 'package:yope_yourpet_social_networking/modules/search/pages/search_page.dart';
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
          const CardScreen(
            title: 'Navigation Tab Bar page',
            pageWidget: AppNavigationConfig(),
          ),
          CardScreen(
            title: listHomeDashBoardScreen[0],
            pageWidget: const NewsFeedPage(),
          ),
          const CardScreen(
            title: 'Message page',
            pageWidget: MessagePage(),
          ),
          const CardScreen(
            title: 'Search Page',
            pageWidget: SearchPage(),
          ),
          const CardScreen(
            title: 'Personal Profile',
            pageWidget: PersonalProfile(),
          ),
        ],
      ),
    );
  }
}
