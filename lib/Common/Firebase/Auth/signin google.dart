import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_eye/Common/Firebase/Firestore/create%20new%20user.dart';

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

googleSignUp (context) async {
  await signInWithGoogle();
  if (FirebaseAuth.instance.currentUser != null) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final email = FirebaseAuth.instance.currentUser!.email;
    final name = FirebaseAuth.instance.currentUser!.displayName ?? "";
    final photo = FirebaseAuth.instance.currentUser!.photoURL ?? "";

    createUser(uid, email, name, photo);
    Navigator.pushNamedAndRemoveUntil(context, '/profiles', (route) => false);
  }
}