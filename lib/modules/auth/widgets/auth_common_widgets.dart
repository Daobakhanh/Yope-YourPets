import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';

class IconLoginOptional extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onTap;
  const IconLoginOptional({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          // color: AppColors.light,
        ),
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  late TextEditingController _controller;
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final thememode = Theme.of(context).brightness;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        // style: const TextStyle(color: Colors.white),
        controller: _controller,
        obscureText: _isObscure,
        decoration: InputDecoration(
          // focusColor: AppColors.light,

          //set custom color of text field with theme
          // filled: true,
          // fillColor: thememode == ThemeMode.dark
          //     ? AppColors.inputTextDarkMode
          //     : AppColors.keyboardLightGray,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          labelText: 'Password',
          hintText: 'Enter Password',
          hintStyle: const TextStyle(color: AppTextColor.grey),
          prefixIcon: const Icon(Icons.lock_open),
          suffixIcon: IconButton(
            // color: thememode == ThemeMode.dark ? AppColors.light : ,
            icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
        ),
      ),
    );
  }
}

class TextInput extends StatefulWidget {
  final String? label;
  final double? height;
  final Icon? icon;
  const TextInput({
    Key? key,
    required this.label,
    this.icon,
    this.height,
  }) : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final thememode = Theme.of(context).brightness;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        // ignore: unnecessary_null_in_if_null_operators
        height: widget.height ?? null,
        child: TextField(
          // style: const TextStyle(color: Colors.white),
          controller: _controller,
          decoration: InputDecoration(
            // filled: true,
            // fillColor: thememode == ThemeMode.dark
            //     ? AppColors.inputTextDarkMode
            //     : AppColors.keyboardLightGray,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            prefixIcon: widget.icon,
            labelText: widget.height == null ? widget.label : null,
            hintText: 'Enter ${widget.label}',
            hintStyle: const TextStyle(color: AppTextColor.grey),
          ),
        ),
      ),
    );
  }
}
