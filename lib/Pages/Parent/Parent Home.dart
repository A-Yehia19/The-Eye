import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';
import 'package:the_eye/Pages/Parent/Common/WIdgets/Settings%20Button.dart';
import 'package:the_eye/Pages/Parent/Parent%20Home/Widgets/Account%20Settings.dart';
import 'package:the_eye/Pages/Parent/Parent%20Home/Widgets/Children%20Accounts.dart';
import 'package:the_eye/Common/Widgets/Upper%20Section.dart';

class ParentHome extends StatelessWidget {
  final Parent parent;
  const ParentHome({super.key, required this.parent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UpperSection(user: parent),
            SizedBox(height: 30.h),
            AccountSettings(parent: parent),
            SizedBox(height: 40.h),
            ChildrenAccounts(parent: parent),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SettingsButton(text: 'Delete Account', icon: Icons.delete_forever, isDanger: true, onPressed: () {}),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      )
    );
  }
}
