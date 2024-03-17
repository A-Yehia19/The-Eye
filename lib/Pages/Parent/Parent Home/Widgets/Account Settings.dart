import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';
import 'package:the_eye/Pages/Parent/Common/WIdgets/Settings%20Button.dart';
import 'package:the_eye/Constants/Colors.dart';

class AccountSettings extends StatelessWidget {
  final Parent parent;
  const AccountSettings({super.key, required this.parent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          padding: EdgeInsets.all(15.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black,
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              SettingsButton(text: 'Change Username', icon: Icons.person_rounded, onPressed: () {}),
              SettingsButton(text: 'Change Password', icon: Icons.lock_rounded, onPressed: () {}),
              SettingsButton(text: 'Report Video', icon: Icons.edit_rounded, onPressed: () {}),
              SettingsButton(text: 'Remove ADs', icon: Icons.remove_circle_outline, onPressed: () {}),
              SettingsButton(text: 'Sign out', icon: Icons.logout_rounded, onPressed: () {}),
            ],
          ),
        ),
        Positioned(
          top: -10,
          left: 25.w,
          child: Text(
            ' Account Settings',
            style: TextStyle(
              color: textColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
