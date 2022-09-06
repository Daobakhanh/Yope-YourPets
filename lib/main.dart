import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/blocs/app_bloc.dart';
import 'package:yope_yourpet_social_networking/blocs/chatty_bloc_observer.dart';
import 'package:yope_yourpet_social_networking/modules/auth/pages/auth_page.dart';
import 'package:yope_yourpet_social_networking/modules/firebase/widgets/firebase_initializer.dart';
import 'package:yope_yourpet_social_networking/modules/navigation/pages/app_navigation.dart';
import 'package:yope_yourpet_social_networking/providers/bloc_provider.dart';
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
  final appStateBloc = AppStateBloc();

  // Create storage

  // Read value

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

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
      // ignore: unrelated_type_equality_checks
      // home: const DashBoardPage());
      home: BlocProvider(
        bloc: appStateBloc,
        child: StreamBuilder<AppState>(
          stream: appStateBloc.appStateStream,
          initialData: appStateBloc.initState,
          builder: (context, snapshot) {
            if (snapshot.data == AppState.authorized) {
              return const AppNavigationConfig();
            } else if (snapshot.data == AppState.unAuthorized) {
              return BlocProvider(child: const AuthPage(), bloc: appStateBloc);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
