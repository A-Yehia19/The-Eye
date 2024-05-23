// add_photo_child.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../Common/Firebase/Storage/upload_user_image.dart';

class AddPhotoChild extends StatefulWidget {
  @override
  AddPhotoChildState createState() => AddPhotoChildState();
}

class AddPhotoChildState extends State<AddPhotoChild> {
  File? _imageFile;

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 45,
                backgroundImage: _imageFile == null ? null : FileImage(_imageFile!),
              ),
            ),
            Positioned(
              child: IconButton(onPressed: pickImage,
                  icon: Icon(Icons.add_a_photo)),
              bottom: -10,
              left: 80,
            ),
          ],
        ),
      ],
    );
  }
}