import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/themes/app_colors.dart';
import 'package:yope_yourpet_social_networking/themes/app_fonts.dart';

class AppTextStyle {
  static const h1 = TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  static const h2 = TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: AppTextColor.light,
  );
  static const h3 = TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.avenir,
      fontSize: 22,
      color: AppTextColor.light);
  static const largeTitle = TextStyle(
      fontFamily: AppFonts.avenir,
      fontSize: 34,
      color: AppColors.light,
      fontWeight: FontWeight.bold);
  static const body20 = TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 20,
    color: AppTextColor.light,
  );
  static const body15 = TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 15,
    color: AppTextColor.light,
  );
  static const body17 = TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 17,
    // color: AppTextColor.light,
  );
  static const caption11 = TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 11,
    color: AppTextColor.light,
  );
  static const caption13 = TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 13,
    color: AppTextColor.light,
  );
  static const appName = TextStyle(
    fontFamily: AppFonts.silkscreen,
    fontSize: 50,
    color: AppTextColor.pink,
    // fontWeight: FontWeight.bold,
  );
}
