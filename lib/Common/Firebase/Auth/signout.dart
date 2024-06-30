import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_eye/Common/Firebase/Auth/signin%20google.dart';

enum AuthenticationType {
  apple,
  google,
  simple;

  static const defaultValue = AuthenticationType.simple;

  factory AuthenticationType.fromString(String? name) {
    if (name == null || name == '') return defaultValue;

    return AuthenticationType.values.firstWhere(
          (flavor) => flavor.name == name,
      orElse: () => defaultValue,
    );
  }
}

Future<void> signOut(BuildContext context) async {
  final isUserLoggedInFromGoogle = await _checkAuthenticationType();
  if (isUserLoggedInFromGoogle == AuthenticationType.google) {
    await GoogleSignIn().disconnect();
  }
  FirebaseAuth.instance.signOut();
  Navigator.pushNamedAndRemoveUntil(context, '/start', (route) => false);
}

Future<AuthenticationType> _checkAuthenticationType() async {
  final auth = FirebaseAuth.instance;
  final user = auth.currentUser;

  if (user != null) {
    final userCredential = await user.getIdTokenResult();
    if (userCredential.signInProvider == "google.com") {
      return AuthenticationType.google;
    } else if (userCredential.signInProvider == "apple.com") {
      return AuthenticationType.apple;
    }
  }
  return AuthenticationType.defaultValue;
}