import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void signOut(BuildContext context) {
  FirebaseAuth.instance.signOut();
  Navigator.pushNamedAndRemoveUntil(context, '/start', (route) => false);
}
