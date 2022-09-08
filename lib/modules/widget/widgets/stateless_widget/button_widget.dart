import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class LongStadiumButton extends StatelessWidget {
  final Color? color;
  final String? nameOfButton;
  final VoidCallback? onTap;
  const LongStadiumButton(
      {Key? key, required this.nameOfButton, required this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.activeStateGreen,
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: onTap!,
        child: Text(
          nameOfButton!,
          style: AppTextStyle.body15.copyWith(
            fontWeight: FontWeight.bold,
            color: color == null ? AppTextColor.pink : AppTextColor.light,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: color ?? AppColor.light,
          fixedSize: const Size(350, 44),
        ),
      ),
    );
  }
}

class ShortStadiumButton extends StatelessWidget {
  final Color? color;
  final String? nameOfButton;
  final VoidCallback? onTap;
  const ShortStadiumButton(
      {Key? key, required this.nameOfButton, required this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.activeStateGreen,
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: onTap!,
        child: Text(
          nameOfButton!,
          style: AppTextStyle.body15.copyWith(
            fontWeight: FontWeight.bold,
            color: color == null ? AppTextColor.pink : AppTextColor.light,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: color ?? AppColor.light,
          fixedSize: const Size(116, 32),
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final Icon? icon;
  final Color? buttonColor;
  final VoidCallback? onTap;
  final Size? size;
  const CircleButton({
    Key? key,
    required this.icon,
    required this.buttonColor,
    required this.onTap,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: icon,
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: const CircleBorder(),
          fixedSize: size ?? const Size(45, 45)),
    );
  }
}

class LongRectangleButton extends StatelessWidget {
  final Color? color;
  final String? nameOfButton;
  final VoidCallback onTap;
  const LongRectangleButton(
      {Key? key, required this.nameOfButton, required this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).brightness;
    return Container(
      // color: AppColors.activeStateGreen,
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          nameOfButton!,
          style: AppTextStyle.body15.copyWith(
            color: themeData == Brightness.dark
                ? AppTextColor.light
                : AppTextColor.dark,
          ),
        ),
        style: ElevatedButton.styleFrom(
          // shape: const StadiumBorder(),
          backgroundColor:
              themeData == Brightness.dark ? AppColor.grey : AppColor.lightGray,
          fixedSize: const Size(350, 32),
        ),
      ),
    );
  }
}

class ShortRectangleButton extends StatelessWidget {
  final Color? color;
  final String? nameOfButton;
  final VoidCallback onTap;
  const ShortRectangleButton(
      {Key? key, required this.nameOfButton, required this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).brightness;
    return Container(
      // color: AppColors.activeStateGreen,
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          nameOfButton!,
          style: AppTextStyle.body15.copyWith(
            color: themeData == Brightness.dark
                ? AppTextColor.light
                : AppTextColor.dark,
          ),
        ),
        style: ElevatedButton.styleFrom(
          // shape: const StadiumBorder(),
          backgroundColor:
              themeData == Brightness.dark ? AppColor.grey : AppColor.lightGray,
          fixedSize: const Size(110, 32),
        ),
      ),
    );
  }
}

class ShortRectangleCustomFollowButton extends StatefulWidget {
  final Color? color;
  final String? nameOfButton;
  final VoidCallback onTap;
  const ShortRectangleCustomFollowButton(
      {Key? key, required this.nameOfButton, required this.onTap, this.color})
      : super(key: key);

  @override
  State<ShortRectangleCustomFollowButton> createState() =>
      _ShortRectangleCustomFollowButtonState();
}

class _ShortRectangleCustomFollowButtonState
    extends State<ShortRectangleCustomFollowButton> {
  bool isFollow = true;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).brightness;
    return Container(
      // color: AppColors.activeStateGreen,
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          widget.onTap;
          setState(() {
            isFollow = !isFollow;
          });
        },
        child: Text(
          widget.nameOfButton!,
          style: AppTextStyle.body15.copyWith(
            color: isFollow
                ? (themeData == Brightness.dark
                    ? AppTextColor.light
                    : AppTextColor.dark)
                : AppTextColor.light,
          ),
        ),
        style: ElevatedButton.styleFrom(
          // shape: const StadiumBorder(),
          backgroundColor: isFollow
              ? (themeData == Brightness.dark
                  ? AppColor.grey
                  : AppColor.lightGray)
              : AppColor.activeStateBlue,
          fixedSize: const Size(110, 32),
        ),
      ),
    );
  }
}

class SimpleInkWellButton extends StatelessWidget {
  final IconData? iconData;
  final double? size;
  final VoidCallback? onTap;
  const SimpleInkWellButton({Key? key, this.iconData, this.size, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        iconData,
        size: size,
      ),
    );
  }
}
