import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Firebase/Firestore/get%20user.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';
import 'package:the_eye/Pages/Profiles/Widgets/profile_icons.dart';

import '../../Common/Widgets/animated_background.dart';
import '../../Constants/Colors.dart';
import 'Widgets/parent_profile.dart';

class Profiles extends StatefulWidget {
  const Profiles({Key? key}) : super(key: key);

  @override
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  var parent;

  // Get the parent's UID
  final parentUID = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    super.initState();

    parent = getUser(parentUID);
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
                  SizedBox(height: 50.h),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                    child: const Text("Welcome back! Who is watching, now?",
                      style: TextStyle(color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  FutureBuilder(
                    future: parent,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        final parentObj = snapshot.data! as Parent;
                        return ParentProfileBubble(parent: parentObj);
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                  SizedBox(height: 20.h),
                  FutureBuilder(
                    future: parent,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        final parentObj = snapshot.data! as Parent;
                        return ProfileIcons(childIDs: parentObj.children);
                      } else {
                        return const CircularProgressIndicator();
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
