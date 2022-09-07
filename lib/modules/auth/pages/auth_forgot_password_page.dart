import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/auth/utils/auth_show_diolog_utils.dart';
import 'package:yope_yourpet_social_networking/modules/auth/widgets/auth_common_widgets.dart';
import 'package:yope_yourpet_social_networking/modules/widget/widgets/stateless_widget/button_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';
import 'package:yope_yourpet_social_networking/themes/app_text_style.dart';

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
            const TextInputCustom(
              icon: Icon(Icons.email),
              label: 'Your Email',
            ),
            const SizedBox(
              height: 40,
            ),
            LongStadiumButton(
                color: AppColor.pinkAccent,
                nameOfButton: 'SEND',
                onTap: () {
                  showMyDialog(context);
                  debugPrint('Forgot password page: press SEND');
                })
          ],
        ),
      ),
    );
  }
}
