import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/post/pages/post_detail_page.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_like_comment_widget.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_image_sliders_widget.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/statefull_widget/avatar_widgets.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/stateless_widget/space_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class PostWidget extends StatefulWidget {
  final Post post;
  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool hideBio = true;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final scaffoldBackgroundColor = themeData.scaffoldBackgroundColor;
    final brightness = themeData.brightness;
    return InkWell(
      onTap: () {
        String lengthOfTitle = widget.post.title.length.toString();
        debugPrint(lengthOfTitle);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetailPage(
              post: widget.post,
            ),
          ),
        );
        // Navigator.of(context, rootNavigator: true).pushNamed('/postDetail');
      },
      child: Container(
        // height: 400,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color:
                  brightness == Brightness.dark ? AppColor.dark : AppColor.grey,
              offset: const Offset(0, 3),
              blurRadius: 10.0,
              // spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserPostAndInteractiveWidget(post: widget.post),
            const SizeBox10H(),
            Text(
              widget.post.title,
              // maxLines: hideBio ? 1 : 2,
              maxLines: 2,

              overflow: widget.post.title.length > 75
                  ? TextOverflow.ellipsis
                  : TextOverflow.clip,
              // style: AppTextStyle.body15,
            ),
            // TextButton(onPressed: () {}, child: Text("more")),
            // const SizedBox(
            //   height: 3,
            // ),
            widget.post.title.length > 75
                ? TapMoreToSeeDetail(
                    post: widget.post,
                  )
                : const SizeBox5H(),
            ImageSlider(
              pictures: widget.post.photos,
            ),
            // InteractivePostBar(post: widget.post)
            InteractivePostInfor(
              post: widget.post,
            ),
            const SizeBox5H(),
            const LikedInforGeneralWidget(),
            const SizeBox5H(),
            TapToSeeAllCommentWidget(
              post: widget.post,
            )
          ],
        ),
      ),
    );
  }
}

class UserPostAndInteractiveWidget extends StatelessWidget {
  final Post post;
  const UserPostAndInteractiveWidget({Key? key, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CustomAvatar(
            picture: post.photos[0],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.user.name,
              style: AppTextStyle.body20.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '2 hour ago',
              style: AppTextStyle.caption13.copyWith(
                color: AppTextColor.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LikedInforGeneralWidget extends StatelessWidget {
  const LikedInforGeneralWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: const [
          TextSpan(text: 'Liked by '),
          TextSpan(
            text: 'day.21',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: ' and '),
          TextSpan(
            text: '23 others',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class TapToSeeAllCommentWidget extends StatelessWidget {
  final Post post;
  const TapToSeeAllCommentWidget({Key? key, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: GestureDetector(
        onTap: () {
          debugPrint('Tap see all comment');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostDetailPage(
                      post: post,
                    )),
          );
        },
        child: Text(
          'View all comments',
          style: AppTextStyle.caption13.copyWith(color: AppTextColor.grey),
        ),
      ),
    );
  }
}

class TapMoreToSeeDetail extends StatelessWidget {
  final Post post;
  const TapMoreToSeeDetail({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Text(
        "more",
        style: TextStyle(fontStyle: FontStyle.italic, color: AppTextColor.grey),
      ),
      onTap: () {
        debugPrint('Tap more detail Post');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetailPage(
              post: post,
            ),
          ),
        );
      },
    );
  }
}
