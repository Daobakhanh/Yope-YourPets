import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/post/bloc/list_user_like_post_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_user_like_widget.dart';

class PostLikeDetailPage extends StatefulWidget {
  final String? postId;
  const PostLikeDetailPage({Key? key, this.postId}) : super(key: key);

  @override
  State<PostLikeDetailPage> createState() => _PostLikeDetailPageState();
}

class _PostLikeDetailPageState extends State<PostLikeDetailPage> {
  String get postId => widget.postId!;

  ListUserLikePostBloc _listUserLikePostBloc = ListUserLikePostBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listUserLikePostBloc = ListUserLikePostBloc(postId: postId);
    _listUserLikePostBloc.add('getListUserLikePost');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Likes'),
      ),
      // body: Center(child: Text(widget.postId!)),
      body: BlocBuilder<ListUserLikePostBloc, ListUserLikePostState>(
          bloc: _listUserLikePostBloc,
          builder: (context, state) {
            final users = state.users;
            final error = state.error;
            if (users != null) {
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    // color: Colors.amber[colorCodes[index]],
                    child: Center(
                      child: UserLikePostWidget(
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
    );
  }
}
