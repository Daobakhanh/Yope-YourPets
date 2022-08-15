import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/auth/widgets/auth_common_widgets.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/stateless_widget/button_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_colors.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_styles.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Text(
                'Please enter your email address. You will receive a link to create a new password via email.',
                style: AppTextStyle.body17,
              ),
            ),
            const TextInputAuth(
              label: 'Your email',
            ),
            const SizedBox(
              height: 40,
            ),
            LongButton(
                color: AppColors.pinkAccent,
                nameOfButton: 'SEND',
                onTap: () {
                  debugPrint('Forgot password page: press SEND');
                })
          ],
        ),
      ),
    );
  }
}
