import 'package:flutter/material.dart';

import 'package:yope_yourpet_social_networking/common/data_type/userStatus.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

//avatar with active status and name

class AvatarWithNameAndActiveStatus extends StatefulWidget {
  const AvatarWithNameAndActiveStatus(
      {Key? key,
      required this.picture,
      required this.nameOfUser,
      this.userStatus})
      : super(key: key);
  final String picture;
  final String nameOfUser;
  final UserStatus? userStatus;
  @override
  State<AvatarWithNameAndActiveStatus> createState() =>
      _AvatarWithNameAndActiveStatusState();
}

class _AvatarWithNameAndActiveStatusState
    extends State<AvatarWithNameAndActiveStatus> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      width: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.userStatus == UserStatus.online
              ? AvatarWithActiveStatus(picture: widget.picture)
              : Avatar(picture: widget.picture),
          Text(
            widget.nameOfUser,
            style: AppTextStyle.caption11.copyWith(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          )
        ],
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
        Avatar(picture: widget.picture),
        const Positioned(top: 48, left: 43, child: ActiveStatusGreen())
      ]),
    );
  }
}

//avatar just Image
class Avatar extends StatefulWidget {
  const Avatar({Key? key, required this.picture}) : super(key: key);
  final String picture;
  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: CircleAvatar(
        backgroundImage: NetworkImage(widget.picture),
      ),
    );
  }
}

class ActiveStatusGreen extends StatelessWidget {
  const ActiveStatusGreen({Key? key}) : super(key: key);

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
