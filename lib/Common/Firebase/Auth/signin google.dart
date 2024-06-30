import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_eye/Common/Firebase/Firestore/create%20new%20user.dart';

import '../../../Pages/Creator Home/creator_home.dart';
import '../../../Pages/Profiles/profiles.dart';
import '../../../Pages/Signup/Data/Functions/set_parent_pin.dart';
import '../../Models/Classes/Creator.dart';
import '../../Models/Classes/Parent.dart';

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

googleSignIn(context) async {
  await signInWithGoogle();
  if (FirebaseAuth.instance.currentUser != null) {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    // Retrieve the user's data from Firestore
    final userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final userData = userDoc.data();

    // Check if the user is a parent
    bool isParent = userData?['isParent'] ?? false;

    Navigator.pushNamedAndRemoveUntil(context, '/profiles', (route) => false);
  }
}

googleSignUp(bool isParent, context) async {
  await signInWithGoogle();
  if(FirebaseAuth.instance.currentUser != null) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final email = FirebaseAuth.instance.currentUser!.email;
    final name = FirebaseAuth.instance.currentUser!.displayName ?? "";
    final photo = FirebaseAuth.instance.currentUser!.photoURL ?? "";
    var user;
    
    if (isParent) {
      // Call openChangeIdDialog and get the PIN
      Completer<int> pinCompleter = Completer<int>();
      openSetParentPin(context, pinCompleter);
      int pin = await pinCompleter.future;
      user = await createUser(uid, email, name, photo, isParent, pin);
    } else {
      user = await createUser(uid, email, name, photo, isParent);
    }

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