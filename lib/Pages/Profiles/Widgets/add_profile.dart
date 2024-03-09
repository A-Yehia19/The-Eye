import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Constants/Colors.dart';

class AddProfile extends StatelessWidget {
  const AddProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {},
          child:CircleAvatar(
            radius: 75.w,
            backgroundColor: hintColor,
            child: Icon(Icons.add, size: 120.w, color: Colors.white,),
          ),
        ),
        SizedBox(height: 10.w),
        Text(
          "Add child",
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 24.w,
          ),
        ),
      ],
    );
  }
}
