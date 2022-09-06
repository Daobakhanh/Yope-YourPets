import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/statefull_widget/avatar_widgets.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class UserLikePostWidget extends StatefulWidget {
  final User? user;
  const UserLikePostWidget({Key? key, this.user}) : super(key: key);

  @override
  State<UserLikePostWidget> createState() => _UserLikePostWidgetState();
}

class _UserLikePostWidgetState extends State<UserLikePostWidget> {
  bool isFollowed = false;
  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAvatar(picture: widget.user!.avatar!.url!),
              Text(
                widget.user!.displayName.toString(),
              )
            ],
          ),
          SizedBox(
            width: 100,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  // If the button is pressed, return green, otherwise blue
                  if (isFollowed) {
                    return brightness == Brightness.dark
                        ? AppColor.dark
                        : AppColor.keyboardGray;
                  }
                  return AppColor.activeStateBlue;
                }),
              ),
              onPressed: () {
                setState(() {
                  isFollowed = !isFollowed;
                });
                debugPrint('Follow');
              },
              child: Text(
                isFollowed ? 'Following' : 'Follow',
                style:
                    AppTextStyle.caption13.copyWith(color: AppTextColor.light),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
