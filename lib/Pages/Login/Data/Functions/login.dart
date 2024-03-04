import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_eye/Common/Firebase/Auth/login%20email.dart';

login(email, password, context) async {
  await logInWithEmailAndPassword(email, password);
  if (FirebaseAuth.instance.currentUser != null) {
    Navigator.pushNamedAndRemoveUntil(context, '/profiles', (route) => false);
  }
}