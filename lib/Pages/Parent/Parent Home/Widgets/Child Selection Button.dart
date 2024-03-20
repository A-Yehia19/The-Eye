import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/Child.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Constants/links.dart';
import 'package:the_eye/Pages/Parent/Child%20Control/Child%20Control.dart';

class ChildSelectionButton extends StatelessWidget {
  final Parent parent;
  final Child child;
  const ChildSelectionButton({super.key, required this.child, required this.parent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7.r),
        child: Container(
          height: 65.h,
          width: double.infinity,
          color: primaryColor,
          child: Row(
            children: [
              SizedBox(width: 15.w),
              Container(
                height: 35.h,
                width: 35.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: child.imageURL.isNotEmpty
                        ? NetworkImage(child.imageURL)
                        : const NetworkImage(profilePlaceholderURL),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 15.w),
              Text(
                child.name,
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 60.w,
                  height: 30.h,
                  alignment: Alignment.centerRight,
                  decoration: const BoxDecoration(
                    color: highlightColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
                  ),
                  child: IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChildControl(parent: parent,
                    child: child))),
                    icon: Icon(Icons.arrow_forward_outlined, color: secondaryColor, size: 20.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
