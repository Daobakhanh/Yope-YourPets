import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/widget/widgets/stateless_widget/space_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class AvatarHaveStory extends StatelessWidget {
  final User? user;
  // final

  const AvatarHaveStory({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backGroundScaffold = Theme.of(context).scaffoldBackgroundColor;
    const double sizeOfAvatar =
        70; //container flexible depends on size of Avatar
    return InkWell(
      onTap: () {
        debugPrint('Tap to see story');
      },
      child: Container(
        // color: AppColor.lightGray,
        // padding: const EdgeInsets.symmetric(horizontal: 5),
        margin: const EdgeInsets.only(left: 10),
        // width: 70 + 15, // don't have because handle sub string of user's name
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: sizeOfAvatar,
              width: sizeOfAvatar,
              // margin: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: (sizeOfAvatar / 2) - 2,
                backgroundColor: backGroundScaffold,
                child: CircleAvatar(
                  radius: (sizeOfAvatar / 2) - 6,
                  backgroundImage: NetworkImage(user!.avatar!.url!),
                ),
              ),

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColor.pinkGradientBegin,
                    AppColor.pinkGradientStop,
                  ],
                ),
                color: AppColor.pinkAccent,
                shape: BoxShape.circle,
              ),
            ),
            const SizeBox5H(),
            Text(
              user!.displayName.length <= 11
                  ? user!.displayName
                  : '${user!.displayName.substring(0, 9)}...',
              style: AppTextStyle.caption11,
              // overflow: ,
            ),
          ],
        ),
      ),
    );
  }
}

class PersonalCreateStory extends StatelessWidget {
  final String? personalAvatar; //personal
  const PersonalCreateStory(String large, {Key? key, this.personalAvatar})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double sizeOfAvatar = 70;

    return InkWell(
      onTap: () {
        debugPrint('Tap to see story');
      },
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: sizeOfAvatar,
              width: sizeOfAvatar,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: sizeOfAvatar / 2 - 8,
                    backgroundImage: personalAvatar != null
                        ? NetworkImage(personalAvatar!)
                        : const AssetImage('assets/images/logo.png')
                            as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 28,
                      width: 28,
                      decoration: const BoxDecoration(
                        color: AppColor.light,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.add_circle,
                        size: 24,
                        color: AppColor.activeStateBlue,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizeBox5H(),
            const Text(
              'Your story',
              style: AppTextStyle.caption11,
            )
          ],
        ),
      ),
    );
  }
}
