import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/Child.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Parent/Parent%20Home/Widgets/Child%20Selection%20Button.dart';

class ChildrenAccounts extends StatelessWidget {
  final Parent parent;
  const ChildrenAccounts({super.key, required this.parent});

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
            children: parent.children.map((child) => ChildSelectionButton(child: Child(
              id: '12',
              gender: 'male',
              name: 'ali',
              parentID: '123',
              PIN: '1234',
              birthDate: DateTime.now(),
            ))).toList(),
          ),
        ),
        Positioned(
          top: -10,
          left: 25.w,
          child: Text(
            ' Children Accounts',
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
