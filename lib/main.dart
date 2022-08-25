import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/firebase_options.dart';
import 'package:yope_yourpet_social_networking/modules/dashboard/pages/app_dashboard_page.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Add this
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        textTheme: const TextTheme(
            // titleMedium: AppTextStyle.body15, bodyMedium: AppTextStyle.body15
            ),
        appBarTheme: const AppBarTheme(
          color: AppColor.grey,
          centerTitle: true,
        ),
        brightness: Brightness.light,
        fontFamily: "Avenir",
        primarySwatch: Colors.pink,
        // bottomAppBarColor: Colors.yellow,
      ),
      home: const DashBoardPage(),
    );
  }
}
