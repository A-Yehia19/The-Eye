import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_eye/Common/Firebase/Auth/login%20email.dart';

import '../../../Common/Models/Classes/Creator.dart';
import '../../Creator Home/creator_home.dart';
import '../../Profiles/profiles.dart';

login(email, password, context) async {
  Creator dummyCreator = Creator( //replace with data fetched from firebase
      id: '1',
      gender: 'Male',
      name: 'Dummy Creator',
      transactions: ['transaction1', 'transaction2'],
      videos: ['video1', 'video2']
  );
  await logInWithEmailAndPassword(email, password);
  if (FirebaseAuth.instance.currentUser != null) {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    // Retrieve the user's data from Firestore
    final userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final userData = userDoc.data();

    // Check if the user is a parent
    bool isParent = userData?['isParent'] ?? false;

    if (isParent) {
      // Navigate to the parent's profile page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profiles()), // Navigate to Profiles page
      );
    } else {
      // Navigate to the creator's home page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreatorHome()), // Navigate to CreatorHome page
      );
    }
  }
}