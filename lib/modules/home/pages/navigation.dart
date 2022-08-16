// import 'package:custom_navigation_bar/custom_navigation_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:unicons/unicons.dart';
// import 'package:yope_yourpet_social_networking/modules/auth/pages/auth_forgot_password_page.dart';
// import 'package:yope_yourpet_social_networking/modules/auth/pages/auth_login_page.dart';
// import 'package:yope_yourpet_social_networking/modules/auth/pages/auth_page.dart';
// import 'package:yope_yourpet_social_networking/modules/home/pages/seach_page.dart';
// import 'package:yope_yourpet_social_networking/themes/app_colors.dart';
// import 'package:yope_yourpet_social_networking/themes/app_text_styles.dart';

// // class NewsFeedPage extends StatefulWidget {
// //   const NewsFeedPage({Key? key}) : super(key: key);

// //   @override
// //   State<NewsFeedPage> createState() => _NewsFeedPageState();
// // }

// // class _NewsFeedPageState extends State<NewsFeedPage> {
// //   int _currentIndex = 0;
// //   Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
// //     0: GlobalKey<NavigatorState>(),
// //     1: GlobalKey<NavigatorState>(),
// //     2: GlobalKey<NavigatorState>(),
// //     3: GlobalKey<NavigatorState>(),
// //   };
// //   final List<Widget> _widgetOptions = <Widget>[
// //     const NewsFeedPage(),
// //     const SearchPage(),
// //     const LoginPage(),
// //     const AuthPage()
// //   ];
// //   // final pages = [
// //   //   const NewsFeedPage(),
// //   //   const SearchPage(),
// //   //   const LoginPage(),
// //   //   const AuthPage()
// //   // ];

// //   @override
// //   Widget build(BuildContext context) {
// //     final themeData = Theme.of(context).brightness;

// //     return Scaffold(
// //       appBar: AppBar(
// //         centerTitle: false,
// //         actions: [
// //           InkWell(
// //             child: const Icon(
// //               Icons.add_to_photos_rounded,
// //               size: 30,
// //             ),
// //             onTap: () {
// //               debugPrint('Home: Newfeed - press add');
// //             },
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.only(right: 10, left: 20),
// //             child: InkWell(
// //               child: const Icon(
// //                 UniconsLine.facebook_messenger,
// //                 size: 30,
// //               ),
// //               onTap: () {
// //                 debugPrint('Home: Newfeed - press message');
// //               },
// //             ),
// //           ),
// //         ],
// //         title: Text(
// //           'Yope',
// //           style: AppTextStyle.appName.copyWith(fontSize: 35),
// //         ),
// //       ),
// //       bottomNavigationBar: CustomNavigationBar(
// //         iconSize: 30.0,
// //         selectedColor: AppColors.pinkAccent,
// //         strokeColor: AppColors.pinkAccent,
// //         unSelectedColor:
// //             themeData == Brightness.dark ? AppColors.grey : AppColors.dark,
// //         backgroundColor:
// //             themeData == Brightness.dark ? AppColors.dark : AppColors.lightGray,
// //         items: [
// //           CustomNavigationBarItem(
// //             icon: const Icon(Icons.pets),
// //           ),
// //           CustomNavigationBarItem(
// //             icon: const Icon(Icons.search),
// //           ),
// //           CustomNavigationBarItem(
// //             icon: const Icon(UniconsLine.heart),
// //           ),
// //           CustomNavigationBarItem(
// //             icon: const Icon(Icons.person),
// //           ),
// //         ],
// //         currentIndex: _currentIndex,
// //         onTap: (index) {
// //           setState(
// //             () {
// //               _currentIndex = index;
// //               debugPrint('$index');
// //             },
// //           );
// //         },
// //       ),
// //       body: const SearchPage(),
// //     );
// //   }

// //   buildNavigator() {
// //     return Navigator(
// //       key: navigatorKeys[_currentIndex],
// //       onGenerateRoute: (RouteSettings settings) {
// //         return MaterialPageRoute(
// //             builder: (_) => _widgetOptions.elementAt(_currentIndex));
// //       },
// //     );
// //   }
// // }

// class NewsFeedPage extends StatefulWidget {
//   const NewsFeedPage({Key? key}) : super(key: key);

//   @override
//   State<NewsFeedPage> createState() => _NewsFeedPageState();
// }

// class _NewsFeedPageState extends State<NewsFeedPage> {
//   @override
//   Widget build(BuildContext context) {
//     final themeData = Theme.of(context).brightness;
//     return CupertinoTabScaffold(
//       tabBar: CupertinoTabBar(
//         activeColor: AppColors.pinkAccent,
//         inactiveColor:
//             themeData == Brightness.dark ? AppColors.grey : AppColors.dark,
//         backgroundColor:
//             themeData == Brightness.dark ? AppColors.dark : AppColors.lightGray,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.pets),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(UniconsLine.heart),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//           ),
//         ],
//       ),
//       tabBuilder: (context, index) {
//         switch (index) {
//           case 0:
//             return CupertinoTabView(
//               builder: (context) {
//                 return const CupertinoPageScaffold(
//                   child: SearchPage(),
//                 );
//               },
//             );
//           case 1:
//             return CupertinoTabView(
//               builder: (context) {
//                 return const CupertinoPageScaffold(
//                   child: ForgotPasswordPage(),
//                 );
//               },
//             );
//           case 2:
//             return CupertinoTabView(
//               builder: (context) {
//                 return const CupertinoPageScaffold(
//                   child: AuthPage(),
//                 );
//               },
//             );
//           case 3:
//             return CupertinoTabView(
//               builder: (context) {
//                 return const CupertinoPageScaffold(
//                   child: LoginPage(),
//                 );
//               },
//             );
//           default:
//             return CupertinoTabView(
//               builder: (context) {
//                 return const CupertinoPageScaffold(
//                   child: SearchPage(),
//                 );
//               },
//             );
//         }
//       },
//     );
//   }
// }
