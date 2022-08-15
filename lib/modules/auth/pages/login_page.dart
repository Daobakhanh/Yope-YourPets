import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/auth/widgets/auth_common_widgets.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/stateless_widget/button_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_colors.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      appBar: AppBar(
        backgroundColor: AppColors.dark,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Welcome back! ',
                  style: AppTextStyle.largeTitle,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Login to your account',
                  style: AppTextStyle.body17,
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
            SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const TextInputAuth(
                    label: 'Username',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const PasswordInput(),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        debugPrint('Press forgot password');
                      },
                      child: Text(
                        'Forgot your password?',
                        style: AppTextStyle.body15.copyWith(
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  LongButton(
                    color: AppColors.pinkAccent,
                    nameOfButton: "LOGIN",
                    onTap: () {
                      debugPrint('press login');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
