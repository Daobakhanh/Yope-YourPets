import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_container_widget.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_image_sliders_widget.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_like_comment_widget.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/stateless_widget/space_widget.dart';

class PostDetailPage extends StatefulWidget {
  final Post post;
  const PostDetailPage({Key? key, required this.post}) : super(key: key);

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Post detail'),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: (Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserPostAndInteractiveWidget(post: widget.post),
                      const SizeBox10H(),
                      Text(
                        widget.post.title,
                        // style: AppTextStyle.body15,
                      ),

                      ImageSlider(
                        pictures: widget.post.photos,
                      ),
                      // InteractivePostBar(post: widget.post)
                      InteractivePostInfor(
                        isInPostDetail: false,
                        post: widget.post,
                      ),
                      const SizeBox5H(),
                      const LikedInforGeneralWidget(),
                      const SizeBox20H(),
                    ],
                  )),
                ),
              ],
            ),
            const Positioned(
              child: CommentBar(),
              bottom: 10,
            ),
          ],
        ),
      ),
    );
  }
}
