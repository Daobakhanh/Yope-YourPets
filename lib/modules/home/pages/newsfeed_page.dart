import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:yope_yourpet_social_networking/modules/home/pages/seach_page.dart';
import 'package:yope_yourpet_social_networking/themes/app_colors.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_styles.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({Key? key}) : super(key: key);

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  int _currentIndex = 0;
  final pages = [const NewsFeedPage(), const SearchPage()];
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).brightness;

    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          actions: [
            InkWell(
              child: const Icon(
                Icons.add_to_photos_rounded,
                size: 30,
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
                  size: 30,
                ),
                onTap: () {
                  debugPrint('Home: Newfeed - press message');
                },
              ),
            ),
          ],
          title: Text(
            'Yope',
            style: AppTextStyle.appName.copyWith(fontSize: 35),
          ),
        ),
        // body: pages[_currentIndex],
        bottomNavigationBar: CustomNavigationBar(
          iconSize: 30.0,
          selectedColor: AppColors.pinkAccent,
          strokeColor: AppColors.pinkAccent,
          unSelectedColor:
              themeData == Brightness.dark ? AppColors.grey : AppColors.dark,
          backgroundColor: themeData == Brightness.dark
              ? AppColors.dark
              : AppColors.lightGray,
          items: [
            CustomNavigationBarItem(
              icon: const Icon(Icons.pets),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.search),
            ),
            CustomNavigationBarItem(
              icon: const Icon(UniconsLine.heart),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.person),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
