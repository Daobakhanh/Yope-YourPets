import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class TextIconButton extends StatelessWidget {
  const TextIconButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).brightness;
    return TextButton.icon(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: themeData == Brightness.dark
            ? AppTextColor.light
            : AppTextColor.dark,
      ),
      label: Text(
        title,
        style: TextStyle(
          color: themeData == Brightness.dark
              ? AppTextColor.light
              : AppTextColor.dark,
        ),
      ),
    );
  }
}

class InforNumberProfile extends StatelessWidget {
  final int number;
  final String title;
  const InforNumberProfile(
      {Key? key, required this.number, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$number',
            style: AppTextStyle.body17.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: AppTextStyle.body15,
          ),
        ],
      ),
    );
  }
}
