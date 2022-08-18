import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:yope_yourpet_social_networking/modules/dashboard/pages/app_dashboard_page.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yope',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: AppColor.grey,
          centerTitle: true,
        ),
        brightness: Brightness.dark,
        fontFamily: "Avenir",
        primarySwatch: Colors.yellow,
        bottomAppBarColor: Colors.yellow,
      ),
      home: const DashBoardPage(),
    );
  }
}
