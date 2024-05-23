import 'dart:isolate';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:the_eye/Common/Models/Classes/Child.dart';

updateOnDispose (child) {
  // Identify the root isolate to pass to the background isolate.
  RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
  Isolate.spawn(isolateUpdate, [rootIsolateToken, child]);
}

isolateUpdate(List<dynamic> args) async {
  // Register the background isolate with the root isolate.
  BackgroundIsolateBinaryMessenger.ensureInitialized(args[0]);

  final Child child = args[1];
  await Firebase.initializeApp();
  final db = FirebaseFirestore.instance;
  await db.collection('users').doc(child.id).update({
    'screenTime': child.screenTime,
    'history': child.history,
    'likes': child.likes,
    'dislikes': child.dislikes,
    'favourites': child.favourites,
  });
}
