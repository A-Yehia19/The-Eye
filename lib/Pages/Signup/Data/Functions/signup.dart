import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_eye/Common/Firebase/Auth/signup%20email.dart';
import 'package:the_eye/Common/Firebase/Firestore/create%20new%20user.dart';
import 'package:the_eye/Common/Models/Classes/Creator.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';
import 'package:the_eye/Common/Widgets/SnackBar.dart';
import 'package:the_eye/Pages/Creator%20Home/creator_home.dart';
import 'package:the_eye/Pages/Profiles/profiles.dart';
import 'package:the_eye/Pages/Signup/Data/Functions/set_parent_pin.dart';

signup(name, email, password, rePassword, isParent, File? imageFile, context) async {
  if (password != rePassword) {
    Bar.showSnackBar('Passwords do not match', Colors.red);
    return;
  }

  await signUpWithEmailAndPassword(email, password);
  if (FirebaseAuth.instance.currentUser != null) {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    // Upload the image to Firebase Storage and get the download URL
    String imageUrl = '';
    if (imageFile != null) {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("profile_pics");
      UploadTask uploadTask = ref.putFile(imageFile);
      await uploadTask.whenComplete(() => null);
      imageUrl = await ref.getDownloadURL();
    }

    String photo = imageUrl.isNotEmpty ? imageUrl : FirebaseAuth.instance.currentUser!.photoURL ?? '';

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