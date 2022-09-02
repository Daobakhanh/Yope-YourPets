import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/comment.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/post/repo/post_detail_repo.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_container_widget.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_image_sliders_widget.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_like_comment_widget.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/stateless_widget/space_widget.dart';

class PostDetailPage extends StatefulWidget {
  final Post post;
  //get id of post to fetch comment API
  // final Comments comments;
  const PostDetailPage({Key? key, required this.post}) : super(key: key);

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late Future<Comments> comments;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    comments = readJsonFromAssetComment();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Post detail'),
        ),
        body: FutureBuilder(
          future: Future.wait([comments]),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              debugPrint('has data');
              final dataComments = snapshot.data![0];
              final List<Comment> comments = dataComments.results;
              return Stack(
                children: [
                  ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UserPostAndInteractiveWidget(post: widget.post),
                            const SizeBox10H(),
                            Text(
                              widget.post.description!,
                              // style: AppTextStyle.body15,
                            ),

                            ImageSlider(
                              pictures: widget.post.images,
                            ),
                            // InteractivePostBar(post: widget.post)
                            InteractivePostInfor(
                              isInPostDetail: false,
                              post: widget.post,
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
                            return UserCommentWidget(comment: comments[index]);
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                  const Positioned(
                    child: CommentBar(),
                    bottom: 10,
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
