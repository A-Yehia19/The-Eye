import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Pages/Profiles/Widgets/profile_icons.dart';

import '../../Common/Widgets/Back.dart';
import '../../Common/Widgets/animated_background.dart';
import '../../Constants/Colors.dart';
import 'Widgets/parent_profile.dart';

class Profiles extends StatefulWidget {
  const Profiles({Key? key}) : super(key: key);

  @override
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  late Future<DocumentSnapshot> parentFuture;
  late List<Future<DocumentSnapshot>> childrenFutures;

  @override
  void initState() {
    super.initState();

    // Get the parent's UID
    final parentUID = FirebaseAuth.instance.currentUser!.uid;

    // Fetch the parent's document from Firestore
    parentFuture = FirebaseFirestore.instance.collection('users').doc(parentUID).get();

    // Fetch the children's documents from Firestore
    childrenFutures = [];
    parentFuture.then((parentDoc) {
      final childrenUIDs = parentDoc['children'];
      for (final childUID in childrenUIDs) {
        childrenFutures.add(FirebaseFirestore.instance.collection('users').doc(childUID).get());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor, // Set the background color to primaryColor
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
          child: Stack( // Use Stack to allow for overlapping of children
            children: [
              const AnimatedBackground(), // Use the AnimatedBackground widget
              Column( // Wrap the rest of the widgets in a Column
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(alignment: Alignment.topLeft, child: Back()),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                    child: const Text("Welcome back! Who is watching, now?",
                      style: TextStyle(color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  FutureBuilder<DocumentSnapshot>(
                    future: parentFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        final parentData = snapshot.data!.data() as Map<String, dynamic>;
                        return ParentProfileBubble(parentData: parentData);
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  SizedBox(height: 20.h),
                  FutureBuilder<DocumentSnapshot>(
                    future: parentFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        final parentData = snapshot.data!.data() as Map<String, dynamic>;
                        final childrenIDs = (parentData['children'] as List<dynamic>).map((item) => item.toString()).toList();
                        return ProfileIcons(childIDs: childrenIDs);
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}