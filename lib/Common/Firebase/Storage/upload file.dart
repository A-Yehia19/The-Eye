import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Common/Widgets/SnackBar.dart';

Future<String> uploadFileFirebase(String filePath, String creatorID, String fileName) async {
  final FirebaseStorage storage = FirebaseStorage.instance;
  File file = File(filePath);

  try {
    fileName = '$fileName.${file.path.split('.').last}';
    await storage.ref('videos').child(creatorID).child(fileName).putFile(file);
  } on FirebaseException catch (e) {
    Bar.showSnackBar(e.message, Colors.red);
  }

  final link = await storage.ref('videos').child(creatorID).child(fileName).getDownloadURL();
  return link;
}
