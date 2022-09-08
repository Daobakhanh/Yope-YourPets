import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/post/bloc/post_create_comment_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/post/bloc/post_delete_comment_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/post/bloc/post_detail_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/post/common/post_detail_event.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_comment_widget.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_container_widget.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_image_sliders_widget.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_like_post_bar_widget.dart';
import 'package:yope_yourpet_social_networking/modules/widget/widgets/stateless_widget/space_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';

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
  // final PostDetailEventMap postDetailEvent = PostDetailEventMap(postId: postId, event: event);
  late TextEditingController _controller;
  String contentComment = '';
  final _postDetailBloc = PostDetailBloc();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
    // _postDetailBloc = PostDetailBloc(postId: postId);
    _postDetailBloc.add(PostDetailEventClass(
        event: PostDetailEvent.getPostDetail, postId: postId));
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final Size size = MediaQuery.of(context).size;

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
                            UserPostInforWidget(
                              post: post,
                              callbackFunt: () {
                                // _handleDeletePost(postId);
                              },
                            ),
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
                              key: UniqueKey(),
                              onLongPress: () {
                                // debugPrint(
                                //     'Callback function in post detail page');
                                _handleDeleteComment(
                                    postId, comments[index].id!);
                              },
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
                    bottom: 10,
                    child: Container(
                      color: scaffoldBackgroundColor,
                      // color: AppColor.pinkAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 70,
                            width: size.width - 80,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: SizedBox(
                                // ignore: unnecessary_null_in_if_null_operators
                                height: 50,
                                child: TextField(
                                  controller: _controller,
                                  onChanged: (String contentValue) {
                                    contentComment = contentValue;
                                    // debugPrint(content);
                                  },
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                    // prefixIcon: widget.icon,
                                    labelText: 'Comment...',
                                    hintText: 'Enter Comment',
                                    hintStyle: const TextStyle(
                                        color: AppTextColor.grey),
                                    suffixIcon: IconButton(
                                      onPressed: _controller.clear,
                                      icon: const Icon(Icons.clear),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizeBox10W(),
                          InkWell(
                            onTap: () {
                              debugPrint('Tap send comment');
                              FocusScope.of(context).unfocus();
                              _handleCreateComment(contentComment);
                              _postDetailBloc.add(PostDetailEventClass(
                                  postId: postId,
                                  event: PostDetailEvent.getPostDetail));
                              _controller.clear();
                            },
                            child: const Icon(Icons.send),
                          )
                        ],
                      ),
                    ),
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

  Future<void> _handleCreateComment(String content) async {
    debugPrint('Content: $content');
    await CreateCommentBloc.createCommentEvent(content, postId);
  }

  Future<void> _handleDeleteComment(String postId, String commentId) async {
    debugPrint('Callback function deleteComment is Called');
    await DeleteCommentBloc.deleteCommentEvent(postId, commentId);
    _postDetailBloc.add(PostDetailEventClass(
        postId: postId, event: PostDetailEvent.getPostDetail));
  }

  // Future<void> _handleDeletePost(String postId) async {
  //   debugPrint('Callback function deletePost is Called');
  //   await DeletePostBloc.deletePostEvent(postId);
  // }
}
