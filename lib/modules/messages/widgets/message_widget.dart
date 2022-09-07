import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/common/api/public.dart';
import 'package:yope_yourpet_social_networking/common/data_type/user_status.dart';
import 'package:yope_yourpet_social_networking/modules/messages/models/chat.dart';
import 'package:yope_yourpet_social_networking/models/user/user.dart';
import 'package:yope_yourpet_social_networking/modules/messages/pages/message_detail_page.dart';
import 'package:yope_yourpet_social_networking/modules/widget/widgets/statefull_widget/avatar_widgets.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';
import 'package:yope_yourpet_social_networking/utils/date_time_parse.dart';

class HorizontalListActiveUserScroll extends StatefulWidget {
  final List<User> users;
  const HorizontalListActiveUserScroll({Key? key, required this.users})
      : super(key: key);
  @override
  State<HorizontalListActiveUserScroll> createState() =>
      _HorizontalListActiveUserScrollState();
}

class _HorizontalListActiveUserScrollState
    extends State<HorizontalListActiveUserScroll> {
  List<User> get users => widget.users;
  @override
  Widget build(BuildContext context) {
    // final List<User> users = widget.dataUsers.results;
    return SizedBox(
      height: 82,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (BuildContext context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 14, right: 5),
            //conment fix bug
            child: AvatarWithNameAndActiveStatus(
              user: users[index],
              userStatus: UserStatus.online,
            ),
          );
        },
      ),
    );
  }
}

//vertial list user with message
class VerticalListUserWithLastMessage extends StatefulWidget {
  const VerticalListUserWithLastMessage({Key? key, required this.chats})
      : super(key: key);
  final Chats chats;
  @override
  State<VerticalListUserWithLastMessage> createState() =>
      _VerticalListUserWithLastMessageState();
}

class _VerticalListUserWithLastMessageState
    extends State<VerticalListUserWithLastMessage> {
  @override
  Widget build(BuildContext context) {
    final List<Chat> chats = widget.chats.results;
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: chats.length,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 14),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: LastMessageUserWidget(
                  chat: chats[index],
                ),
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

class LastMessageUserWidget extends StatefulWidget {
  final Chat chat;

  const LastMessageUserWidget({
    Key? key,
    required this.chat,
  }) : super(key: key);

  @override
  State<LastMessageUserWidget> createState() => _LastMessageUserWidgetState();
}

class _LastMessageUserWidgetState extends State<LastMessageUserWidget> {
  Chat get chat => widget.chat;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => MessageDetailPage(
                  user: chat.user!,
                )),
          ),
        );
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            CustomAvatar(picture: chat.user!.avatar!.url!),
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
                            chat.user!.displayName,
                            style: AppTextStyle.body17
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          // width: 60,
                          child: Text(
                              dateTimeDetect(chat.createdAt!).toString(),
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
                      chat.text!,
                      style: AppTextStyle.body17,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
