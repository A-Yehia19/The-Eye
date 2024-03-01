import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Pages/Profiles/Widgets/add_profile.dart';
import 'package:the_eye/Pages/Profiles/Widgets/profile_icons.dart';

import '../../Common/Widgets/Back.dart';
import '../../Constants/Colors.dart';

class Profiles extends StatelessWidget {
  const Profiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(alignment: Alignment.topLeft, child: Back()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Who is watching?", style: TextStyle(color: CupertinoColors.white, fontSize: 28, fontWeight: FontWeight.w500),),
                  ),
                  ProfileIcons(),
                ],
              ),
            ),
          )
      ),
    );

  }
}
