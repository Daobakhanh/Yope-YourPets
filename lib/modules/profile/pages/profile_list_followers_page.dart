import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/profile/blocs/profile_list_follower_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/profile/common/profile_event.dart';
import 'package:yope_yourpet_social_networking/modules/user/widgets/user_in_list_widget.dart';

class ListFollowerPage extends StatefulWidget {
  final String userId;
  const ListFollowerPage({Key? key, required this.userId}) : super(key: key);

  @override
  State<ListFollowerPage> createState() => _ListFollowerPageState();
}

class _ListFollowerPageState extends State<ListFollowerPage> {
  final _listFollowerBloc = ProfileListFollowerBloc();
  String get userId => widget.userId;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _listFollowerBloc.add(
        ProfileEvent(userId: userId, event: ProfileEventEnum.getListFollower));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Followers'),
        ),
        body:
            BlocBuilder<ProfileListFollowerBloc, ProfileListFollowerBlocState>(
          bloc: _listFollowerBloc,
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
                    // color: Colors.amber[colorCodes[index]],
                    child: Center(
                      child: UserinListWidget(
                        isFollowing: false,
                        user: users[index],
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        ));
  }
}
