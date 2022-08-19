import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/post/models/post.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/like_comment_widget.dart';
import 'package:yope_yourpet_social_networking/modules/post/widgets/post_image_sliders_widget.dart';
import 'package:yope_yourpet_social_networking/modules/profile/widgets/personal_profile_widget.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/statefull_widget/avatar_widgets.dart';
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
        debugPrint('Tap to Post');
      },
      child: Container(
        height: 380,
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, bottom: 10),
                  child: CustomAvatar(
                    picture: widget.post.photos[0],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Edward Kelly',
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
            ),
            Text(
              'As conscious traveling Paupers we must always be concerned about our dear Mother Earth. If you think about it, you travel across her face, and She is the host to your journey; without Her we could not find the unfolding adventures that attract and feed',
              // maxLines: hideBio ? 1 : 2,
              maxLines: 2,

              overflow: hideBio ? TextOverflow.ellipsis : TextOverflow.clip,
              // style: AppTextStyle.body15,
            ),
            // TextButton(onPressed: () {}, child: Text("more")),
            // const SizedBox(
            //   height: 3,
            // ),
            GestureDetector(
              child: Text(
                hideBio ? "more" : "hide",
                style: const TextStyle(
                    fontStyle: FontStyle.italic, color: AppTextColor.grey),
              ),
              onTap: () {
                debugPrint('hello');
                setState(() {
                  hideBio = !hideBio;
                });
              },
            ),
            ImageSlider(
              pictures: widget.post.photos,
            ),
            // InteractivePostBar(post: widget.post)
            InteractivePostBar(
              post: widget.post,
            ),
          ],
        ),
      ),
    );
  }
}
