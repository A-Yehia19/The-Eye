import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/Child.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';
import 'package:the_eye/Common/Widgets/Upper%20Section.dart';
import 'package:the_eye/Pages/Parent/Child%20Control/Widgets/Customize%20Content.dart';
import 'package:the_eye/Pages/Parent/Child%20Control/Widgets/Screen%20Time.dart';
import 'package:the_eye/Pages/Parent/Child%20History/ChildHistory.dart';
import 'package:the_eye/Pages/Parent/Common/WIdgets/Settings%20Button.dart';

class ChildControl extends StatelessWidget {
  final Parent parent;
  final Child child;
  const ChildControl({super.key, required this.child, required this.parent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              UpperSection(user: child),
              SizedBox(height: 30.h),
              ScreenTime(period: child.screenTime),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SettingsButton(text: 'Watch History', icon: Icons.edit_document, onPressed: () => watchHistory(context)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SettingsButton(text: 'Change PIN', icon: Icons.lock_rounded, onPressed: () {}),
              ),
              SizedBox(height: 20.h),
              CustomizeContent(child: child),
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

  watchHistory(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ChildHistory(parent: parent,
    child: child)));
  }
}
