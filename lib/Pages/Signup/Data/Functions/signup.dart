import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_eye/Common/Firebase/Auth/signup%20email.dart';
import 'package:the_eye/Common/Firebase/Firestore/create%20new%20user.dart';

import '../../../../Common/Widgets/SnackBar.dart';

signup(name, email, password, rePassword, context) async {
  if (password != rePassword) {
    Bar.showSnackBar('Passwords do not match', Colors.red);
    return;
  }

  await signUpWithEmailAndPassword(email, password);
  if (FirebaseAuth.instance.currentUser != null) {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    String photo = FirebaseAuth.instance.currentUser!.photoURL ?? '';

    createUser(uid, email, name, photo);
    Navigator.pushNamedAndRemoveUntil(context, '/profiles', (route) => false);
  }
}