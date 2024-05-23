import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddPhotoChild extends StatefulWidget {
  const AddPhotoChild({super.key});

  @override
  AddPhotoChildState createState() => AddPhotoChildState();
}

class AddPhotoChildState extends State<AddPhotoChild> {
  File? _imageFile;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

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
              bottom: -10,
              left: 80,
              child: IconButton(onPressed: pickImage,
                  icon: const Icon(Icons.add_a_photo)),
            ),
          ],
        ),
      ],
    );
  }
}