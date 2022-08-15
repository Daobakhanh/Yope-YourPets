import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key, required this.title, required this.pageWidget})
      : super(key: key);

  final Widget pageWidget;
  final String title;
  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          // ignore: avoid_print
          print('pressed cardScreen');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => widget.pageWidget));
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          height: 60,
          width: 100,
          alignment: Alignment.center,
          child: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14), color: Colors.blue[900]),
        ),
      ),
    );
  }
}
