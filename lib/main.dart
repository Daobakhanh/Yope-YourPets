import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/blocs/app_bloc.dart';
import 'package:yope_yourpet_social_networking/blocs/chatty_bloc_observer.dart';
import 'package:yope_yourpet_social_networking/modules/app_theme/bloc/app_theme_bloc.dart';
import 'package:yope_yourpet_social_networking/modules/app_theme/enum/app_theme_state_enum.dart';
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
  final _appStateBloc = AppStateBloc();
  final _appThemeBloc = AppThemeBloc();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle();
    return BlocProvider(
      bloc: _appThemeBloc,
      child: StreamBuilder<AppThemeStateEnum>(
        stream: _appThemeBloc.stream,
        // initialData: _appThemeBloc.initialThemeState,
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Yope',
            theme: ThemeData(
              textTheme: const TextTheme(
                  // titleMedium: AppTextStyle.body15, bodyMedium: AppTextStyle.body15
                  ),
              appBarTheme: const AppBarTheme(
                color: AppColor.greyBold,
                centerTitle: true,
              ),
              brightness: snapshot.data == AppThemeStateEnum.dark
                  ? Brightness.dark
                  : Brightness.light,
              fontFamily: "Avenir",
              primarySwatch: Colors.pink,
            ),
            home: BlocProvider(
              bloc: _appStateBloc,
              child: StreamBuilder<AppState>(
                stream: _appStateBloc.appStateStream,
                initialData: _appStateBloc.initState,
                builder: (context, snapshot) {
                  if (snapshot.data == AppState.authorized) {
                    return const AppNavigationConfig();
                  } else if (snapshot.data == AppState.unAuthorized) {
                    return BlocProvider(
                        child: const AuthPage(), bloc: _appStateBloc);
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
