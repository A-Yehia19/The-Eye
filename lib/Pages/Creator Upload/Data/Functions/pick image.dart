import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Common/Widgets/SnackBar.dart';

Future<String?> pickImage() async {
  // Select a file from the device
  final result = await FilePicker.platform.pickFiles(type: FileType.image,);

  if (result == null) {
    Bar.showSnackBar("Please select an image", Colors.red);
    return null;
  }

  return result.files.single.path;
}