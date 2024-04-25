import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Firebase/Auth/signout.dart';
import 'package:the_eye/Common/Firebase/Firestore/get%20user.dart';
import 'package:the_eye/Pages/Creator%20Home/Widgets/creator_options.dart';
import 'package:the_eye/Pages/Creator%20Home/Widgets/uploads_list.dart';
import 'package:the_eye/Common/Models/Classes/Creator.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth; // Use a prefix to avoid naming conflicts

import '../../Common/Models/Classes/User.dart';
import '../../Common/Widgets/Upper Section.dart';
import '../Parent/Common/WIdgets/Settings Button.dart';

class CreatorHome extends StatelessWidget {
  const CreatorHome({super.key});

  @override
  Widget build(BuildContext context) {

    auth.FirebaseAuth firebaseAuth = auth.FirebaseAuth.instance;

    // Get the currently signed-in user
    auth.User? currentUser = firebaseAuth.currentUser;
    return FutureBuilder(
      future: getUser(currentUser!.uid),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final creator = snapshot.data as Creator;
          return Scaffold(
            body: Column(
              children: [
                Stack(
                  children: [
                    UpperSection(user: creator,),
                    const CreatorOptions(),
                    Positioned(
                      top: 40, // Adjust the value as needed
                      right: 20, // Adjust the value as needed
                      child: IconButton(
                        icon: const Icon(Icons.notifications_none_rounded, color: Colors.white),
                        onPressed: () {
                          // Add your onPressed code here
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30.0, bottom: 10), // Adjust the value as needed
                  child: const Text("Your Uploads", style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w500),),
                ),
                const UploadsList(),
                Padding(
                  padding: EdgeInsets.all(10.h),
                  child: SettingsButton(text: 'Sign out', icon: Icons.logout_rounded, onPressed: () => signOut(context)),
                ),
              ],
            ),
            //bottomNavigationBar: SemiCircle(),
          );
        }
      },
    );
  }
}