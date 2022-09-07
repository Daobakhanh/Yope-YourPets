import 'package:flutter/material.dart';

class MessageInteractiveWidget extends StatelessWidget {
  const MessageInteractiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: Row(
        children: const [
          ButtonInkwellBasic(
            icon: Icons.add_circle,
          ),
          ButtonInkwellBasic(
            icon: Icons.camera_alt,
          ),
          ButtonInkwellBasic(
            icon: Icons.photo,
          ),
          ButtonInkwellBasic(
            icon: Icons.photo,
          ),
        ],
      ),
    );
  }
}

class ButtonInkwellBasic extends StatelessWidget {
  final double? size;
  final IconData icon;
  const ButtonInkwellBasic({Key? key, this.size, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: InkWell(
        onTap: () {},
        child: Icon(
          icon,
          size: size,
        ),
      ),
    );
  }
}
