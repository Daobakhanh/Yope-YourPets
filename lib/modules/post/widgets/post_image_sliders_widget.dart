import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/models/picture/picture.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/stateless_widget/space_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';

class ImageSlider extends StatefulWidget {
  final List<Picture>? pictures;
  const ImageSlider({Key? key, this.pictures}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _current = 0;
  int lengthOfPictures = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lengthOfPictures = widget.pictures!.length;
  }

  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: CarouselSlider(
                items: imageSliders(widget.pictures!),
                carouselController: _controller,
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 1.0,
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        _current = index;
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 3,
        ),
        //indicator
        lengthOfPictures != 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators(lengthOfPictures, _current, context),
              )
            : const SizeBox10H()
      ],
    );
  }
}

List<Widget> imageSliders(List<Picture> pictures) {
  late List<Widget> imageSlidesList = pictures
      .map(
        (item) => Container(
          margin: const EdgeInsets.all(5.0),
          // child: ClipRRect(
          //   borderRadius: const BorderRadius.all(
          //     Radius.circular(5),
          //   ),
          //   // child:
          //   child: Image.network(item, fit: BoxFit.contain, width: 1000.0),
          // ),
          child: GestureDetector(
            child: Image.network(item.url!, fit: BoxFit.cover),
          ),
        ),
      )
      .toList();
  return imageSlidesList;
}

//indicator
List<Widget> indicators(imagesLength, currentIndex, BuildContext context) {
  final brightness = Theme.of(context).brightness;
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
          color: currentIndex == index
              ? (brightness == Brightness.dark
                  ? AppColor.lightGray
                  : AppColor.grey)
              : (brightness == Brightness.dark
                  ? AppColor.grey
                  : Colors.black26),
          shape: BoxShape.circle),
    );
  });
}
