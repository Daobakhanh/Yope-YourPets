import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/widget/widgets/statefull_widget/avatar_widgets.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class AvatarWithMessageCard extends StatefulWidget {
  const AvatarWithMessageCard(
      {Key? key,
      required this.lastMessage,
      required this.numOfMessageUnseen,
      required this.nameOfUser,
      required this.timeOfLastMessage,
      required this.picture})
      : super(key: key);
  final String picture;
  final String nameOfUser;
  final String lastMessage;
  final int numOfMessageUnseen;
  final String timeOfLastMessage;
  @override
  State<AvatarWithMessageCard> createState() => _AvatarWithMessageCardState();
}

class _AvatarWithMessageCardState extends State<AvatarWithMessageCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: AppColors.activeStateGreen,
      height: 60,
      width: 344,
      child: Row(children: [
        CustomAvatar(picture: widget.picture),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                // color: AppColors.activeStatePurple,
                height: 22,
                child: Row(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        widget.nameOfUser,
                        style: AppTextStyle.body17
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: Text("${widget.timeOfLastMessage}AM",
                          style: AppTextStyle.caption13
                              .copyWith(color: AppTextColor.grey)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                // color: AppColors.activeStateOrange,
                height: 22,
                child: Text(
                  widget.lastMessage,
                  style: AppTextStyle.body17,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
