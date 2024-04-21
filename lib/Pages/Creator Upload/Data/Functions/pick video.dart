import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Common/Widgets/SnackBar.dart';

Future<PlatformFile?> pickVideo() async {
  // Select a file from the device
  final result = await FilePicker.platform.pickFiles(
    type: FileType.video,
    withData: false,
    // Ensure to get file stream for better performance
    withReadStream: true,
  );

  if (result == null) {
    Bar.showSnackBar("Please select a video", Colors.red);
    return null;
  }

  return result.files.single;
}