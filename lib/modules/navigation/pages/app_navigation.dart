import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/newsfeed/pages/newsfeed_page.dart';
import 'package:yope_yourpet_social_networking/modules/notifications/pages/notification_page.dart';
import 'package:yope_yourpet_social_networking/modules/profile/pages/profile_personal_page.dart';
import 'package:yope_yourpet_social_networking/modules/search/pages/search_page.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';

class AppNavigationConfig extends StatefulWidget {
  const AppNavigationConfig({Key? key}) : super(key: key);

  @override
  State<AppNavigationConfig> createState() => _AppNavigationConfigState();
}

class _AppNavigationConfigState extends State<AppNavigationConfig> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).brightness;
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: AppColor.pinkAccent,
        inactiveColor:
            themeData == Brightness.dark ? AppColor.grey : AppColor.dark,
        backgroundColor:
            themeData == Brightness.dark ? AppColor.dark : AppColor.lightGray,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              // onGenerateRoute: ,
              // routes: {
              //   '/postDetail': (context) => const PostDetailPage(),
              // },

              builder: (context) {
                return const CupertinoPageScaffold(
                  child: NewsFeedPage(),
                );
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(
                  child: SearchPage(),
                );
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(
                  child: NotificationPage(),
                );
              },
            );
          case 3:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(
                  child: ProfilePersonalPage(),
                );
              },
            );
          default:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(
                  child: NewsFeedPage(),
                );
              },
            );
        }
      },
    );
  }
}
