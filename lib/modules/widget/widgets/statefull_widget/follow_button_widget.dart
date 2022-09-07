import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class FollowButtonWidget extends StatefulWidget {
  final bool isFollowing;

  const FollowButtonWidget({Key? key, required this.isFollowing})
      : super(key: key);

  @override
  State<FollowButtonWidget> createState() => _FollowButtonWidgetState();
}

class _FollowButtonWidgetState extends State<FollowButtonWidget> {
  bool get isFollowing => widget.isFollowing;
  bool isFollowed = false;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    isFollowed = isFollowing;
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return SizedBox(
      width: 110,
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
          // debugPrint('Follow');
          // _handleFollowUser(isFollowed);
        },
        child: Text(
          isFollowed ? 'Following' : 'Follow',
          style: AppTextStyle.caption13.copyWith(color: AppTextColor.light),
        ),
      ),
    );
  }
}

class FollowWidgetCustom extends StatefulWidget {
  final bool isFollowing;
  final VoidCallback onTap;
  const FollowWidgetCustom(
      {Key? key, required this.onTap, required this.isFollowing})
      : super(key: key);

  @override
  State<FollowWidgetCustom> createState() => _FollowWidgetCustomState();
}

class _FollowWidgetCustomState extends State<FollowWidgetCustom> {
  bool get isFollowing => widget.isFollowing;
  bool isFollowed = false;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    isFollowed = isFollowing;
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Center(
      child: ElevatedButton(
        onPressed: () {
          widget.onTap;
          setState(() {
            isFollowed = !isFollowed;
          });
        },
        child: Text(
          isFollowed ? 'Following' : 'Follow',
          style: AppTextStyle.body15.copyWith(
            color: isFollowed
                ? (brightness == Brightness.dark
                    ? AppTextColor.light
                    : AppTextColor.dark)
                : AppTextColor.light,
          ),
        ),
        style: ElevatedButton.styleFrom(
          // shape: const StadiumBorder(),
          backgroundColor: isFollowed
              ? (brightness == Brightness.dark
                  ? AppColor.grey
                  : AppColor.lightGray)
              : AppColor.activeStateBlue,
          fixedSize: const Size(110, 32),
        ),
      ),
    );
  }
}
