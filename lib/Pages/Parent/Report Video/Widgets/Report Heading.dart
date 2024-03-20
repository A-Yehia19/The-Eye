import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Constants/Colors.dart';

import '../Data/Variables.dart';

class ReportHeading extends StatelessWidget {
  final String videoID;
  const ReportHeading({super.key, required this.videoID});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '  Video ID',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.h),
          TextField(
            onChanged: (value) => reportVideoID = value,
            decoration: const InputDecoration(
              filled: false,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor)),
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
            style: const TextStyle(color: textColor),
            maxLines: 1,
            cursorColor: primaryColor,
          ),
          SizedBox(height: 20.h),
          const Text(
            '  Report title',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.h),
          TextField(
            onChanged: (value) => reportTitle = value,
            decoration: const InputDecoration(
              filled: false,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor)),
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
            style: const TextStyle(color: textColor),
            maxLines: 1,
            cursorColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
