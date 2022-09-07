import 'package:flutter/material.dart';

import 'package:yope_yourpet_social_networking/common/data_type/user_status.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/messages/pages/message_detail_page.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

//avatar with active status and name

class AvatarWithNameAndActiveStatus extends StatefulWidget {
  final User user;
  final UserStatus? userStatus;
  const AvatarWithNameAndActiveStatus(
      {Key? key, this.userStatus, required this.user})
      : super(key: key);

  @override
  State<AvatarWithNameAndActiveStatus> createState() =>
      _AvatarWithNameAndActiveStatusState();
}

class _AvatarWithNameAndActiveStatusState
    extends State<AvatarWithNameAndActiveStatus> {
  User get user => widget.user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessageDetailPage(
              user: user,
            ),
          ),
        );
      },
      child: SizedBox(
        height: 82,
        width: 70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.userStatus == UserStatus.online
                ? AvatarWithActiveStatus(picture: user.avatar!.url!)
                : CustomAvatar(picture: user.avatar!.url!),
            Text(
              user.displayName,
              style:
                  AppTextStyle.caption11.copyWith(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

//avatar with active Status
class AvatarWithActiveStatus extends StatefulWidget {
  const AvatarWithActiveStatus({Key? key, required this.picture})
      : super(key: key);
  final String picture;
  @override
  State<AvatarWithActiveStatus> createState() => _AvatarWithActiveStatus();
}

class _AvatarWithActiveStatus extends State<AvatarWithActiveStatus> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Stack(children: [
        CustomAvatar(picture: widget.picture),
        const Positioned(top: 48, left: 43, child: ActiveStatusDotGreen())
      ]),
    );
  }
}

//avatar just Image
class CustomAvatar extends StatefulWidget {
  const CustomAvatar({Key? key, required this.picture, this.size})
      : super(key: key);
  final Size? size;
  final String picture;
  @override
  State<CustomAvatar> createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size == null ? 60 : widget.size?.height,
      width: widget.size == null ? 60 : widget.size?.width,
      child: CircleAvatar(
        backgroundColor: AppColor.pinkAccent,
        backgroundImage: NetworkImage(widget.picture),
      ),
    );
  }
}

class ActiveStatusDotGreen extends StatelessWidget {
  const ActiveStatusDotGreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: AppColor.light),
          color: AppColor.activeStateGreen,
          shape: BoxShape.circle),
    );
  }
}
