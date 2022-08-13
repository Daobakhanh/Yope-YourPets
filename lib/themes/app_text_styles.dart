import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/themes/app_colors.dart';
import 'package:yope_yourpet_social_networking/themes/app_fonts.dart';

class AppTextStyle {
  static TextStyle h1 = const TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 40,
    color: AppColors.light,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h2 = const TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.light,
  );
  static TextStyle h3 = const TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.avenir,
      fontSize: 22,
      color: AppColors.light);
  static TextStyle largeTitle = const TextStyle(
      fontFamily: AppFonts.avenir,
      fontSize: 34,
      color: AppColors.light,
      fontWeight: FontWeight.bold);
  static TextStyle body20 = const TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 20,
    color: AppColors.light,
  );
  static TextStyle body15 = const TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 15,
    color: AppColors.light,
  );
  static TextStyle body17 = const TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 17,
    color: AppColors.light,
  );
  static TextStyle caption11 = const TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 11,
    color: AppColors.light,
  );
  static TextStyle caption13 = const TextStyle(
    fontFamily: AppFonts.avenir,
    fontSize: 13,
    color: AppColors.light,
  );
}
