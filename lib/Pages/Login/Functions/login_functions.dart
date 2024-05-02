import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_eye/Common/Firebase/Auth/login%20email.dart';
import 'package:the_eye/Common/Firebase/Firestore/get%20user.dart';
import 'package:the_eye/Common/Models/Classes/Creator.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';

import '../../Creator Home/creator_home.dart';
import '../../Profiles/profiles.dart';

login(email, password, context) async {
  await logInWithEmailAndPassword(email, password);
  if (FirebaseAuth.instance.currentUser != null) {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    var user = await getUser(uid);

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