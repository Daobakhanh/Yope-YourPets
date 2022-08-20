import 'package:flutter/material.dart';

class PostCommentPage extends StatefulWidget {
  const PostCommentPage({Key? key}) : super(key: key);

  @override
  State<PostCommentPage> createState() => _PostCommentPageState();
}

class _PostCommentPageState extends State<PostCommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
    );
  }
}
