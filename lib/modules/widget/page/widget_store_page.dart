import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_comment_widget.dart';
import 'package:yope_yourpet_social_networking/modules/widget/widgets/statefull_widget/card_screen.dart';
import 'package:yope_yourpet_social_networking/modules/widget/widgets/stateless_widget/button_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class WidgetStorePage extends StatelessWidget {
  const WidgetStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets Store'),
      ),
      body: ListView(
        children: [
          //Card screen
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              'Card Screen',
              style: AppTextStyle.h1,
            ),
          ),
          const CardScreen(
            title: 'Widgets store page',
            pageWidget: WidgetStorePage(),
          ),
          //Button Widgets
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              'Button Widgets',
              style: AppTextStyle.h1,
            ),
          ),
          const SizedBox(height: 10),
          LongStadiumButton(
            color: AppColor.pinkAccent,
            nameOfButton: 'Log in',
            onTap: () {
              debugPrint('object');
            },
          ),
          const SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShortStadiumButton(
                nameOfButton: 'Follow',
                onTap: () {
                  debugPrint('Press short Btn');
                },
              ),
              CircleButton(
                icon: const Icon(Icons.message),
                buttonColor: AppColor.activeStateBlue,
                onTap: () {
                  debugPrint('hello');
                },
              ),
              CircleButton(
                icon: const Icon(Icons.phone),
                buttonColor: AppColor.activeStateGreen,
                onTap: () {},
              ),
              CircleButton(
                icon: const Icon(
                  Icons.close,
                  color: AppColor.grey,
                ),
                buttonColor: AppColor.light,
                size: const Size(28, 28),
                onTap: () {},
              )
            ],
          ),
          const CommentBar(),
          // const AvatarHaveStory(
          //   picture: "https://randomuser.me/api/portraits/men/24.jpg",
          // ),
        ],
      ),
    );
  }
}
