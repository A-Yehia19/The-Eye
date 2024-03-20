import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';
import 'package:the_eye/Common/Widgets/Upper%20Section.dart';
import 'package:the_eye/Constants/Colors.dart';

import 'Widgets/Desired Flags.dart';
import 'Widgets/Report Description.dart';
import 'Widgets/Report Heading.dart';

class ReportVideo extends StatelessWidget {
  final Parent parent;
  final String videoID;
  const ReportVideo({super.key, required this.parent, required this.videoID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              UpperSection(user: parent),
              Text(
                'Report Video',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ReportHeading(videoID: videoID),
              SizedBox(height: 30.h),
              const DesiredFlags(),
              SizedBox(height: 25.h),
              const ReportDescription(),
              SizedBox(height: 30.h),
              InkWell(
                onTap: () => confirmReport(),
                child: Container(
                  width: 105.w,
                  height: 30.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: const Text('Report', style: TextStyle(color: secondaryColor, fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        )
    );
  }

  confirmReport(){

  }
}
