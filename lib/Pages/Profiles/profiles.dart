import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Pages/Profiles/Widgets/profile_icons.dart';

import '../../Common/Widgets/Back.dart';
import '../../Constants/Colors.dart';

class Profiles extends StatelessWidget {
  const Profiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(alignment: Alignment.topLeft, child: Back()),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: const Text("Who is watching?",
                  style: TextStyle(color: primaryColor, fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              const ProfileIcons(),
            ],
          ),
        ),
      ),
    );

  }
}
