import 'package:flutter/material.dart';

class PostCreatePage extends StatefulWidget {
  const PostCreatePage({Key? key}) : super(key: key);

  @override
  State<PostCreatePage> createState() => _PostCreatePageState();
}

class _PostCreatePageState extends State<PostCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create post'),
      ),
      body: const Center(
        child: Text('Feature comming soon'),
      ),
    );
  }
}

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class PostCreatePage extends StatefulWidget {
//   const PostCreatePage({Key? key}) : super(key: key);

//   @override
//   _PostCreatePageState createState() => _PostCreatePageState();
// }

// class _PostCreatePageState extends State<PostCreatePage> {
//   /// Variables
//   // ignore: avoid_init_to_null
//   File? imageFile = null;

//   /// Widget
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Image Picker"),
//         ),
//         body: Container(
//             child: imageFile == null
//                 ? Container(
//                     alignment: Alignment.center,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         ElevatedButton(
//                           onPressed: () {
//                             _getFromGallery();
//                           },
//                           child: const Text("PICK FROM GALLERY"),
//                         ),
//                         Container(
//                           height: 40.0,
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             _getFromCamera();
//                           },
//                           child: const Text("PICK FROM CAMERA"),
//                         )
//                       ],
//                     ),
//                   )
//                 : Image.file(
//                     imageFile!,
//                     fit: BoxFit.cover,
//                   )));
//   }

//   /// Get from gallery
//   _getFromGallery() async {
//     final pickedFile = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     setState(() {
//       imageFile = File(pickedFile!.path);
//     });
//   }

//   /// Get from Camera
//   _getFromCamera() async {
//     final pickedFile = await ImagePicker().pickImage(
//       source: ImageSource.camera,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     setState(() {
//       imageFile = File(pickedFile!.path);
//     });
//   }
// }
