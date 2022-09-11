import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yope_yourpet_social_networking/common/public/public.dart';
import 'package:yope_yourpet_social_networking/modules/messages/widgets/message_widget.dart';
import 'package:yope_yourpet_social_networking/modules/profile/common/profile_event.dart';
import 'package:yope_yourpet_social_networking/modules/search/bloc/search_list_user_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/search/widgets/search_text_input_widget.dart';
import 'package:yope_yourpet_social_networking/modules/user/widgets/user_in_list_widget.dart';
import 'package:yope_yourpet_social_networking/modules/widget/widgets/stateless_widget/space_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class SearchPage extends StatefulWidget {
  // final List<User> users;
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchListUserBloc listGetUsersBloc = SearchListUserBloc();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getDofhuntUserID();
  }

  getDofhuntUserID() async {
    String? dofhuntUserIdRes = await getDofhuntUserId();
    debugPrint(dofhuntUserIdRes);
    // setState(() {
    //   dofhuntUserId = dofhuntUserIdRes ?? '';
    // });
    listGetUsersBloc.add(
      ProfileEvent(
          userId: dofhuntUserIdRes!, event: ProfileEventEnum.getListFollowing),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: BlocBuilder<SearchListUserBloc, SearchListBlocState>(
        bloc: listGetUsersBloc,
        builder: (context, state) {
          // final size = MediaQuery.of(context).size;
          final usersRecent = state.usersFollowing;
          final userSuggest = state.usersFollower;
          if (usersRecent != null && userSuggest != null) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 90,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text('RECENT SEARCHES',
                            style: AppTextStyle.caption13.copyWith(
                                color: AppTextColor.grey,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizeBox15H(),
                      HorizontalListActiveUserScroll(users: usersRecent),
                      const SizeBox20H(),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text('SUGGESTED',
                            style: AppTextStyle.caption13.copyWith(
                                color: AppTextColor.grey,
                                fontWeight: FontWeight.bold)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            itemCount: userSuggest.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                height: 60,
                                // color: Colors.amber[colorCodes[index]],
                                child: Center(
                                  child: UserinListWidget(
                                    isFollowing: false,
                                    user: userSuggest[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Positioned(top: 10, child: SearchTextInputBar())
              ],
            );
          }
          return const SearchTextInputBar();
        },
      ),
    );
  }
}
