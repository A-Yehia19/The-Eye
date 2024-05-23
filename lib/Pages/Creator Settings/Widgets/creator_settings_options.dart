import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Common/Firebase/Auth/signout.dart';
import '../../../Common/Models/Classes/Creator.dart';
import '../../../Constants/Colors.dart';
import '../../Parent/Common/WIdgets/Settings Button.dart';
import '../../Parent/Parent Home/Functions/account_settings_functions.dart';

class CreatorSettingsOptions extends StatelessWidget {
  final Creator creator;
  const CreatorSettingsOptions({super.key, required this.creator});

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
              SettingsButton(text: 'Change Username', icon: Icons.person_rounded, onPressed: () => showChangeUsernameDialog(context)),
              SettingsButton(text: 'Change Password', icon: Icons.lock_rounded, onPressed: () => showChangePasswordDialog(context)),
              SettingsButton(text: 'Sign out', icon: Icons.logout_rounded, onPressed: () => signOut(context)),
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
