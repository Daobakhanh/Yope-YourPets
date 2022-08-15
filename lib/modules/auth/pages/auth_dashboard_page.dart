import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/auth/common/auth_list_screen.dart';
import 'package:yope_yourpet_social_networking/modules/auth/pages/auth_forgot_password_page.dart';
import 'package:yope_yourpet_social_networking/modules/auth/pages/auth_page.dart';
import 'package:yope_yourpet_social_networking/modules/auth/pages/auth_login_page.dart';
import 'package:yope_yourpet_social_networking/modules/auth/pages/auth_sign_up_page.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/statefull_widget/card_screen.dart';
// import 'package:social_network_newsfeed/common/data_type/list_screen.dart';
// import 'package:social_network_newsfeed/modules/auth/pages/login_page.dart';
// import 'package:social_network_newsfeed/modules/posts/pages/list_posts_page.dart';

class DashBoardAuthPage extends StatelessWidget {
  const DashBoardAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final paddingSafeAreaSize = MediaQuery.of(context).padding.top +
    MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Dashboard'),
      ),
      body: ListView(
        children: [
          CardScreen(
            title: listAuthDashBoardScreen[0],
            pageWidget: const AuthPage(),
          ),
          CardScreen(
            title: listAuthDashBoardScreen[1],
            pageWidget: const LoginPage(),
          ),
          CardScreen(
            title: listAuthDashBoardScreen[2],
            pageWidget: const SignUpPage(),
          ),
          CardScreen(
            title: listAuthDashBoardScreen[3],
            pageWidget: const ForgotPasswordPage(),
          ),
          // CardScreen(
          //   title: listScreen[2],
          //   pageWidget: const MessagePage(),
          // ),
          // CardScreen(
          //   title: listScreen[3],
          //   pageWidget: const ListPostsPage(),
          // ),
          // const CardScreen(
          //   title: 'Login Page',
          //   pageWidget: LoginPage(),
          // )
        ],
      ),
    );
  }
}
