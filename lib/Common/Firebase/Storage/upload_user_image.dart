import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

Future<void> uploadUserImage(File imageFile) async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    // Create a reference to the location you want to upload to in Firebase Storage
    Reference storageReference = FirebaseStorage.instance.ref().child('userImages/${user.uid}');

    // Upload the file to Firebase Storage
    await storageReference.putFile(imageFile);
  }
}