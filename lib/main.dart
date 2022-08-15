import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/dashboard/pages/app_dashboard_page.dart';
import 'package:yope_yourpet_social_networking/themes/app_colors.dart';
// import 'package:yope_yourpet_social_networking/themes/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final darkMode = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yope',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Avenir",
        // primaryColor: darkMode ? AppTextColor.light : AppTextColor.dark,
      ),
      home: const DashBoardPage(),
    );
  }
}
