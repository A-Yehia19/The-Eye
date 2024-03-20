import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Add%20Child/add_child.dart';

class AddChildButton extends StatelessWidget {
  final Parent parent;
  const AddChildButton({super.key, required this.parent});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddChild())),
          child: Container(
            height: 45.h,
            width: 45.h,
            margin: EdgeInsets.only(top: 15.h,bottom: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: primaryColor,
                width: 3,
              ),
            ),
            child: Icon(
              Icons.add,
              color: primaryColor,
              size: 30.r,
            )
          ),
        ),
        Text(
          'Add Child',
          style: TextStyle(
            color: primaryColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
