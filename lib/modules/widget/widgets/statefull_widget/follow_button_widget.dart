import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class FollowWidget extends StatefulWidget {
  final bool isFollowing;
  final Function onTap;
  const FollowWidget({Key? key, required this.onTap, required this.isFollowing})
      : super(key: key);

  @override
  State<FollowWidget> createState() => _FollowWidgetState();
}

class _FollowWidgetState extends State<FollowWidget> {
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
          widget.onTap(isFollowed);
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
