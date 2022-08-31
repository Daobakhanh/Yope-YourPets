import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/models/chat/chat.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/statefull_widget/avatar_widgets.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class ListActiveUserHorizontalScroll extends StatefulWidget {
  const ListActiveUserHorizontalScroll({Key? key, required this.dataUsers})
      : super(key: key);
  final Users dataUsers;
  @override
  State<ListActiveUserHorizontalScroll> createState() =>
      _ListActiveUserHorizontalScrollState();
}

class _ListActiveUserHorizontalScrollState
    extends State<ListActiveUserHorizontalScroll> {
  @override
  Widget build(BuildContext context) {
    final List<User> users = widget.dataUsers.results;
    return SizedBox(
      height: 82,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.dataUsers.results.length,
        itemBuilder: (BuildContext context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 14, right: 5),
            //conment fix bug
            // child: AvatarWithNameAndActiveStatus(
            //   picture: users[index].picture!.large,
            //   nameOfUser: users[index].name,
            //   userStatus: users[index].status,
            // ),
          );
        },
      ),
    );
  }
}

//vertial list user with message
class VerticalListUserWithLastMessage extends StatefulWidget {
  const VerticalListUserWithLastMessage(
      {Key? key, required this.dataUserWithLastChat})
      : super(key: key);
  final Chats dataUserWithLastChat;
  @override
  State<VerticalListUserWithLastMessage> createState() =>
      _VerticalListUserWithLastMessageState();
}

class _VerticalListUserWithLastMessageState
    extends State<VerticalListUserWithLastMessage> {
  @override
  Widget build(BuildContext context) {
    final List<Chat> userWithLastMessage = widget.dataUserWithLastChat.results;
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: widget.dataUserWithLastChat.results.length,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 14),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                // conment fix bug
                // child: AvatarWithMessageCard(
                //     lastMessage: userWithLastMessage[index].text,
                //     numOfMessageUnread: userWithLastMessage[index].unreadCount,
                //     nameOfUser: userWithLastMessage[index].user.name,
                //     picture: userWithLastMessage[index].user.picture!.large,
                //     timeOfLastMessage: userWithLastMessage[index].createdAt),
              ),
              const Divider(
                height: 1,
                thickness: 1,
              )
            ],
          );
        },
      ),
    );
  }
}

class AvatarWithMessageCard extends StatefulWidget {
  const AvatarWithMessageCard(
      {Key? key,
      required this.lastMessage,
      required this.numOfMessageUnread,
      required this.nameOfUser,
      required this.timeOfLastMessage,
      required this.picture})
      : super(key: key);
  final String picture;
  final String nameOfUser;
  final String lastMessage;
  final int numOfMessageUnread;
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
      // width: 344,
      child: Row(
        children: [
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
                        child: Text(widget.timeOfLastMessage.substring(11, 16),
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
        ],
      ),
    );
  }
}
