import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_eye/Common/Firebase/Auth/signup%20email.dart';
import 'package:the_eye/Common/Firebase/Firestore/create%20new%20user.dart';
import 'package:the_eye/Pages/Creator%20Home/creator_home.dart';

import '../../../../Common/Widgets/SnackBar.dart';

signup(name, email, password, rePassword, isParent, context) async {
  if (password != rePassword) {
    Bar.showSnackBar('Passwords do not match', Colors.red);
    return;
  }

  await signUpWithEmailAndPassword(email, password);
  if (FirebaseAuth.instance.currentUser != null) {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    String photo = FirebaseAuth.instance.currentUser!.photoURL ?? '';

    // Pass the role to the createUser function
    createUser(uid, email, name, photo, isParent);
    if (isParent) {
      Navigator.pushNamedAndRemoveUntil(context, '/profiles', (route) => false);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreatorHome()),
      );
    }
  }
}