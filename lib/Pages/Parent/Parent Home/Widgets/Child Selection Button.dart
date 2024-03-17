import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/Child.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Constants/links.dart';

class ChildSelectionButton extends StatelessWidget {
  final Child child;
  const ChildSelectionButton({super.key, required this.child});

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
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: secondaryColor,
                  ),
                ),
              ],
      ),
        ),
      ),
    );
  }
}
