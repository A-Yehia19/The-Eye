import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../Common/Firebase/Firestore/create new user.dart';

Future<void> signup(String name, String email, String password, String confirmPassword, bool isParent, BuildContext context) async {
  if (password != confirmPassword) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Passwords do not match')),
    );
    return;
  }

  try {
    // Create a new user
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Get the created user
    User? user = userCredential.user;

    // Update the user's display name
    await user?.updateProfile(displayName: name);

    // Create a user in Firestore
    if (user != null) {
      await createUser(user.uid, user.email, user.displayName, "assets/images/profile_placeholder.png", isParent);
    }

    // Navigate to the appropriate page
    Navigator.pushNamed(context, isParent ? '/profiles' : '/creator_home');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('The password provided is too weak.')),
      );
    } else if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('The account already exists for that email.')),
      );
    }
  } catch (e) {
    print(e);
  }
}