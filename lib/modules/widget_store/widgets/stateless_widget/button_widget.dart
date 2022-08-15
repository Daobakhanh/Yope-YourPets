import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/themes/app_colors.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_styles.dart';

class LongButton extends StatelessWidget {
  final Color? color;
  final String? nameOfButton;
  final VoidCallback? onTap;
  const LongButton(
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
          primary: color ?? AppColors.light,
          fixedSize: const Size(350, 44),
        ),
      ),
    );
  }
}
