import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Parent/Report%20Video/Data/Variables.dart';

class ReportDescription extends StatelessWidget {
  const ReportDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '  Description',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.h),
          TextField(
            onChanged: (value) => reportDescription = value,
            decoration: const InputDecoration(
              filled: false,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor)),
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
            style: const TextStyle(color: textColor),
            cursorColor: primaryColor,
            maxLines: 6,
          ),
        ],
      ),
    );
  }
}
