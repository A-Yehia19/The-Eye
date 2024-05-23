
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserProfilePic extends StatefulWidget {
  UserProfilePic({Key? key}) : super(key: key);

  @override
  UserProfilePicState createState() => UserProfilePicState();
}

class UserProfilePicState extends State<UserProfilePic> {
  File? _imageFile;

  File? get imageFile => _imageFile;

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
        print('_imageFile after image selection: $_imageFile');
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
            backgroundImage: _imageFile == null
                ? AssetImage('assets/images/profile_placeholder.png') // Replace with your default image path
                : FileImage(_imageFile!) as ImageProvider,
        ),
        Positioned(
          child: IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: pickImage,
          ),
          bottom: 0,
          right: 0,
        ),
      ],
    );
  }
}