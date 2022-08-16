import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/auth/pages/auth_forgot_password_page.dart';
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
    final thememode = Theme.of(context).brightness;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Welcome back! ',
                    style: AppTextStyle.largeTitle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Login to your account',
                    style: AppTextStyle.body17,
                  ),
                ],
              ),
            ),
            const TextInputAuth(
              icon: Icon(Icons.person),
              label: 'Username',
            ),
            const PasswordInput(),
            Container(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPage(),
                    ),
                  );
                  debugPrint('Press forgot password');
                },
                child: Text(
                  'Forgot your password?',
                  style: AppTextStyle.body15.copyWith(
                    color: thememode == Brightness.dark
                        ? AppTextColor.light
                        : AppTextColor.grey,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            LongStadiumButton(
              color: AppColors.pinkAccent,
              nameOfButton: "LOGIN",
              onTap: () {
                debugPrint('press login');
              },
            )
          ],
        ),
      ),
    );
  }
}
