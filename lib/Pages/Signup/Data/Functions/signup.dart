import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_eye/Common/Firebase/Auth/signup%20email.dart';
import 'package:the_eye/Common/Firebase/Firestore/create%20new%20user.dart';
import 'package:the_eye/Common/Models/Classes/Creator.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';
import 'package:the_eye/Common/Widgets/SnackBar.dart';
import 'package:the_eye/Pages/Creator%20Home/creator_home.dart';
import 'package:the_eye/Pages/Profiles/profiles.dart';

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
    var user = await createUser(uid, email, name, photo, isParent);

    if (user is Creator) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CreatorHome(creator: user)), // Navigate to CreatorHome page
      );
    } else if (user is Parent) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Profiles()), // Navigate to Profiles page
      );
    }
  }
}