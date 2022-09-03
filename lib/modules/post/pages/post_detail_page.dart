import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/post/bloc/post_detail_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/post/common/post_detail_event.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_comment_widget.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_container_widget.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_image_sliders_widget.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_like_post_widget.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/stateless_widget/space_widget.dart';

class PostDetailPage extends StatefulWidget {
  final String? postId;
  //get id of post to fetch comment API
  // final Comments comments;
  const PostDetailPage({Key? key, required this.postId}) : super(key: key);

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  String get postId => widget.postId!;
  late PostDetailBloc _postDetailBloc;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _postDetailBloc = PostDetailBloc(postId: postId);
    _postDetailBloc.add(PostDetailEvent.getPostDetail);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Post detail'),
        ),
        body: BlocBuilder<PostDetailBloc, PostDetailBlocState>(
          bloc: _postDetailBloc,
          builder: ((context, state) {
            final post = state.post;
            final comments = state.comments;
            if (post != null && comments != null) {
              return Stack(
                children: [
                  ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UserPostAndInteractiveWidget(post: post),
                            const SizeBox10H(),
                            Text(
                              post.description!,
                              // style: AppTextStyle.body15,
                            ),

                            ImageSlider(
                              pictures: post.images,
                            ),
                            // InteractivePostBar(post: widget.post)
                            InteractivePostInfor(
                              isInPostDetail: false,
                              post: post,
                            ),
                            const SizeBox5H(),
                            // LikeCountWidget(
                            //   post: widget.post,
                            // ),
                            const SizeBox20H(),
                            const Divider(
                              height: 1,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children:
                              List<Widget>.generate(comments.length, (index) {
                            return UserCommentWidget(
                              comment: comments[index],
                              postId: postId,
                            );
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                  Positioned(
                    child: CommentBar(
                      callback: handleCallCreateCommentCallBack,
                      postId: postId,
                    ),
                    bottom: 10,
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        ),
      ),
    );
  }

  void handleCallCreateCommentCallBack() {
    _postDetailBloc.add(PostDetailEvent.getPostDetail);
  }
}
