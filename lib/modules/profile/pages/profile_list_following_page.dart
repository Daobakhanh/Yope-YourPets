import 'package:flutter/material.dart';

class ListFollowingPage extends StatefulWidget {
  const ListFollowingPage({Key? key}) : super(key: key);

  @override
  State<ListFollowingPage> createState() => _ListFollowingPageState();
}

class _ListFollowingPageState extends State<ListFollowingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Following'),
      ),
      body: const Center(child: Text('Following')),
    );
  }
}
