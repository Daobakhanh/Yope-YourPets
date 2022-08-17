import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:yope_yourpet_social_networking/modules/auth/pages/auth_forgot_password_page.dart';
import 'package:yope_yourpet_social_networking/modules/auth/pages/auth_login_page.dart';
import 'package:yope_yourpet_social_networking/modules/auth/pages/auth_page.dart';
import 'package:yope_yourpet_social_networking/modules/home/pages/newsfeed_page.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

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
            icon: Icon(UniconsLine.heart),
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
                  child: ForgotPasswordPage(),
                );
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(
                  child: AuthPage(),
                );
              },
            );
          case 3:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(
                  child: LoginPage(),
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
