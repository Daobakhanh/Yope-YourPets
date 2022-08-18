import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';

class IconButtonOptional extends StatelessWidget {
  const IconButtonOptional({
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
