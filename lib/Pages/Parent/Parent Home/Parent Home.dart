import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Firebase/Firestore/get%20user.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';
import 'package:the_eye/Pages/Parent/Parent%20Home/Functions/account_settings_functions.dart';
import 'package:the_eye/Pages/Parent/Parent%20Home/Widgets/Account%20Settings.dart';
import 'package:the_eye/Pages/Parent/Parent%20Home/Widgets/Add%20Child%20Button.dart';
import 'package:the_eye/Pages/Parent/Parent%20Home/Widgets/Children%20Accounts.dart';
import 'package:the_eye/Common/Widgets/Upper%20Section.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../Common/Models/Classes/User.dart';
import '../Common/WIdgets/Settings Button.dart';

class ParentHome extends StatelessWidget {
  const ParentHome({super.key});

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
          final parent = snapshot.data as Parent;
          return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    UpperSection(user: parent),
                    SizedBox(height: 30.h),
                    AccountSettings(parent: parent),
                    SizedBox(height: 40.h),
                    ChildrenAccounts(),
                    AddChildButton(parent: parent),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SettingsButton(text: 'Delete Account', icon: Icons.delete_forever, isDanger: true, onPressed: () => showDeleteAccountDialog(context)),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              )
          );
        }
      },
    );
  }
}