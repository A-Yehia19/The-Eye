import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Common/Firebase/Firestore/create%20new%20video.dart';
import 'package:the_eye/Common/Widgets/SnackBar.dart';

import '../../Widgets/upload progress.dart';
import '../variables.dart';

void uploadVideoButton(context, titleController, descriptionController) {
  if(videoPath.value == null || thumbnailPath.value == null) {
    Bar.showSnackBar("Please select the files", Colors.red);
    return;
  }

  showAdaptiveDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const UploadProgress(),
  );

  createVideo(
    FirebaseAuth.instance.currentUser!.uid,
    titleController.text,
    descriptionController.text,
    thumbnailPath.value,
    videoPath.value,
  );
}
