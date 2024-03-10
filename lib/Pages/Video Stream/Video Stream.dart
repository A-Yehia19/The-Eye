import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Constants/Colors.dart';

import '../../Common/Models/Classes/Video.dart';
import 'Widgets/Add Comment.dart';
import 'Widgets/Creator Bar.dart';
import 'Widgets/Other Videos.dart';
import 'Widgets/Video Box.dart';
import 'Widgets/Video Information.dart';

class VideoStream extends StatelessWidget {
  final Video video;
  const VideoStream({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoBox(video: video),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: VideoInformation(video: video),
                    ),
                    const SizedBox(height: 15),
                    Divider(color: Colors.black, thickness: 0.8, indent: 20.w, endIndent: 20.w),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CreatorBar(video: video),
                    ),
                    Divider(color: Colors.black, thickness: 0.8, indent: 20.w, endIndent: 20.w),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text('What\'s New Today',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: textColor,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const OtherVideos(),
                  ],
                ),
              ),
            ),
            AddComment(video: video),
          ],
        ),
      ),
    );
  }
}
