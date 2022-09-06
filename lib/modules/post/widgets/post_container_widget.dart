import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/post/pages/post_detail_page.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_like_post_bar_widget.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_image_sliders_widget.dart';
import 'package:yope_yourpet_social_networking/modules/profile/pages/profile_user_by_id_page.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/statefull_widget/avatar_widgets.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/stateless_widget/space_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';
import 'package:yope_yourpet_social_networking/utils/date_time_parse.dart';

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
    int lengthOfDes = 0;
    if (widget.post.description != null) {
      lengthOfDes = widget.post.description!.length;
    }

    final themeData = Theme.of(context);
    final scaffoldBackgroundColor = themeData.scaffoldBackgroundColor;
    final brightness = themeData.brightness;
    return InkWell(
      onTap: () {
        String lengthOfTitle = widget.post.description!.length.toString();
        debugPrint(lengthOfTitle);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetailPage(
              postId: widget.post.id,
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
              widget.post.description!,
              // maxLines: hideBio ? 1 : 2,
              maxLines: 2,

              overflow:
                  lengthOfDes > 75 ? TextOverflow.ellipsis : TextOverflow.clip,
              // style: AppTextStyle.body15,
            ),
            // TextButton(onPressed: () {}, child: Text("more")),
            // const SizedBox(
            //   height: 3,
            // ),
            lengthOfDes > 75
                ? TapMoreToSeeDetail(
                    post: widget.post,
                  )
                : const SizeBox5H(),
            ImageSlider(
              pictures: widget.post.images,
            ),
            // InteractivePostBar(post: widget.post)
            InteractivePostInfor(
              post: widget.post,
            ),
            const SizeBox5H(),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileUserDetail(
              user: post.user!,
            ),
          ),
        );
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CustomAvatar(
              picture: post.user!.avatar!.url!,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user!.displayName,
                style: AppTextStyle.body20.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                dateTimeDetect(post.createdAt.toString()),
                style: AppTextStyle.caption13.copyWith(
                  color: AppTextColor.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TapToSeeAllCommentWidget extends StatelessWidget {
  final Post? post;
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
                      postId: post!.id,
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
  final Post? post;
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
              postId: post!.id,
            ),
          ),
        );
      },
    );
  }
}
