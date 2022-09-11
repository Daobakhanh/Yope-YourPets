import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/common/public/public.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/profile/pages/profile_personal_page.dart';
import 'package:yope_yourpet_social_networking/modules/profile/pages/profile_user_by_id_page.dart';
import 'package:yope_yourpet_social_networking/modules/widget/widgets/statefull_widget/avatar_widgets.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class UserinListWidget extends StatefulWidget {
  final bool isFollowing;
  final User? user;
  const UserinListWidget({Key? key, this.user, required this.isFollowing})
      : super(key: key);

  @override
  State<UserinListWidget> createState() => _UserinListWidgetState();
}

class _UserinListWidgetState extends State<UserinListWidget> {
  User get user => widget.user!;
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
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => user.id != personalId
                      ? ProfileUserDetailPage(
                          user: user,
                        )
                      : const ProfilePersonalPage(),
                ),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAvatar(picture: user.avatar!.url!),
                Text(
                  user.displayName.toString(),
                )
              ],
            ),
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
                // debugPrint('Follow');
                // _handleFollowUser(isFollowed);
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

  // Future<void> _handleFollowUser(bool isFollow) async {
  //   !isFollow
  //       ? await FollowUserRepo.followUser(user.id)
  //       : await FollowUserRepo.unFollowUser(user.id);
  // }
}
