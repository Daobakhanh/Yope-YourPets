import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/messages/pages/messages_home_page.dart';
import 'package:yope_yourpet_social_networking/modules/navigation/pages/app_navigation.dart';
import 'package:yope_yourpet_social_networking/modules/newsfeed/pages/newsfeed_page.dart';
import 'package:yope_yourpet_social_networking/modules/profile/pages/profile_personal_page.dart';
import 'package:yope_yourpet_social_networking/modules/search/pages/search_page.dart';
import 'package:yope_yourpet_social_networking/modules/widget/widgets/statefull_widget/card_screen.dart';

class DashBoardHomePage extends StatelessWidget {
  const DashBoardHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Dashboard'),
      ),
      body: ListView(
        children: const [
          CardScreen(
            title: 'Navigation Tab Bar page',
            pageWidget: AppNavigationConfig(),
          ),
          CardScreen(
            title: 'News feed page',
            pageWidget: NewsFeedPage(),
          ),
          CardScreen(
            title: 'Message page',
            pageWidget: MessagePage(),
          ),
          CardScreen(
            title: 'Search Page',
            pageWidget: SearchPage(),
          ),
          CardScreen(
            title: 'Personal Profile',
            pageWidget: ProfilePersonalPage(),
          ),
        ],
      ),
    );
  }
}
