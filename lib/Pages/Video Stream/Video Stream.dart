import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Constants/Colors.dart';

import '../../Common/Models/Classes/Video.dart';
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    VideoInformation(video: video),
                    const SizedBox(height: 15),
                    const Divider(color: Colors.black, thickness: 0.8),
                    CreatorBar(video: video),
                    const Divider(color: Colors.black, thickness: 0.8),
                    const SizedBox(height: 10),
                    Text('What\'s New Today',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: textColor,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Expanded(child: OtherVideos()),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
