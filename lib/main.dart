import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/blocs/chatty_bloc_observer.dart';
import 'package:yope_yourpet_social_networking/modules/dashboard/pages/app_dashboard_page.dart';
import 'package:yope_yourpet_social_networking/modules/firebase/widgets/firebase_initializer.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';

void main() async {
  // runApp(
  //   //config thêm observe
  //   const FirebaseInitializer(
  //     child: MyApp(),
  //   ),
  // );
  Bloc.observer = ChattyBlocObserver();

  runApp(
    const FirebaseInitializer(
      child: MyApp(),
    ),
  );
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
        brightness: Brightness.dark,
        fontFamily: "Avenir",
        primarySwatch: Colors.pink,
      ),
      home: const DashBoardPage(),
    );
  }
}
