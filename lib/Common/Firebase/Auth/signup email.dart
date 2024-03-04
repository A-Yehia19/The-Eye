import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../Common/Widgets/SnackBar.dart';

signUpWithEmailAndPassword(email, password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    Bar.showSnackBar(e.message, Colors.red);
  }
}
