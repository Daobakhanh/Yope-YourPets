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
          primary: color ?? AppColor.light,
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
          primary: color ?? AppColor.light,
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
          primary: buttonColor,
          shape: const CircleBorder(),
          fixedSize: size ?? const Size(45, 45)),
    );
  }
}
