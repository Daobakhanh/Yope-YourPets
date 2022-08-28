import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:yope_yourpet_social_networking/modules/auth/pages/auth_login_page.dart';
import 'package:yope_yourpet_social_networking/modules/auth/pages/auth_sign_up_page.dart';
import 'package:yope_yourpet_social_networking/modules/auth/utils/auth_login_with_google_utils.dart';
import 'package:yope_yourpet_social_networking/modules/auth/utils/auth_show_diolog_utils.dart';
import 'package:yope_yourpet_social_networking/modules/auth/widgets/auth_common_widgets.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/stateless_widget/button_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final heighOfScreen = size.height;
    return Scaffold(
      // backgroundColor: AppColors.dark,
      appBar: AppBar(
        // elevation: 0,
        // backgroundColor: AppColors.dark,
        title: Text(
          'YOPE',
          style: AppTextStyle.appName
              .copyWith(fontStyle: FontStyle.italic, fontSize: 30),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                  width: 100,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Find new friends nearby',
              style: AppTextStyle.h2.copyWith(fontSize: 40),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Text(
              'With milions of users all over the world, we gives you the ability to connect with people no matter where you are.',
              style: AppTextStyle.body17.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 5),
            child: LongStadiumButton(
              nameOfButton: 'Log In',
              onTap: () {
                // ignore: avoid_print
                print('press log in');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ),
          LongStadiumButton(
            color: AppColor.pinkAccent,
            nameOfButton: 'Sign Up',
            onTap: () {
              // ignore: avoid_print
              print('Press sign up');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const SignUpPage()),
                ),
              );
            },
          ),
          const SizedBox(
            height: 48,
          ),
          Text(
            'Or log in with',
            style: AppTextStyle.caption13.copyWith(
              color: AppTextColor.grey,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconLoginOptional(
                icon: UniconsLine.facebook,
                onTap: () {
                  debugPrint('Press fb');
                  showMyDialog(context);
                },
              ),
              IconLoginOptional(
                icon: UniconsLine.twitter,
                onTap: () {
                  debugPrint('Press twitter');
                  showMyDialog(context);
                },
              ),
              const IconLoginOptional(
                icon: UniconsLine.google,
                onTap: signInWithGoogle,
                // onTap: () {
                //   debugPrint('Press google');
                // },
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
