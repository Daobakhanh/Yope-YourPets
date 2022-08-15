import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/auth/widgets/auth_common_widgets.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/stateless_widget/button_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_colors.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_styles.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 40),
                child: Text(
                  'Create an account',
                  style: AppTextStyle.largeTitle,
                ),
              ),
              const TextInputAuth(
                label: 'Username',
              ),
              const TextInputAuth(
                label: 'Email',
              ),
              const TextInputAuth(
                label: 'Phone',
              ),
              const TextInputAuth(
                label: 'Date of birth',
              ),
              const PasswordInput(),
              const SizedBox(
                height: 20,
              ),
              LongButton(
                  color: AppColors.pinkAccent,
                  nameOfButton: 'SIGN UP',
                  onTap: () {
                    debugPrint('Auth: Sign up Page - press SIGN UP Btn');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
