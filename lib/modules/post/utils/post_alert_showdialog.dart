import 'package:flutter/material.dart';

Future<void> showMyDialogAlert(
    BuildContext context, String content, VoidCallback callbackFunt) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(content),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Confirm !'),
              // Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              callbackFunt();
              Navigator.pop(context, 'OK');
              debugPrint('confirm OK to delete comment');
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
