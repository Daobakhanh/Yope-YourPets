import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/profile/blocs/profile_list_following_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/profile/common/profile_event.dart';
import 'package:yope_yourpet_social_networking/modules/user/widgets/user_in_list_widget.dart';

class ListFollowingPage extends StatefulWidget {
  final String userId;
  const ListFollowingPage({Key? key, required this.userId}) : super(key: key);

  @override
  State<ListFollowingPage> createState() => _ListFollowingPageState();
}

class _ListFollowingPageState extends State<ListFollowingPage> {
  final _listFollowingBloc = ProfileListFollowingBloc();
  String get userId => widget.userId;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _listFollowingBloc.add(
        ProfileEvent(userId: userId, event: ProfileEventEnum.getListFollowing));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Following'),
        ),
        body: BlocBuilder<ProfileListFollowingBloc,
            ProfileListFollowingBlocState>(
          bloc: _listFollowingBloc,
          builder: ((context, state) {
            final users = state.users;
            // final error = state.error;
            if (users != null) {
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 60,
                    child: Center(
                      child: UserinListWidget(
                        user: users[index],
                      ),
                    ),
                  );
                },
              );
            }

            return const Center();
          }),
        ));
  }
}
