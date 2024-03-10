import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Pages/Video%20Stream/Data/Variables.dart';

import 'Recommended Video Card.dart';

class OtherVideos extends StatelessWidget {
  const OtherVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215.h,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsetsDirectional.zero,
        itemCount: recommendedList.length,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) => index == 0
            ? Padding(padding: EdgeInsets.only(left: 20.w), child: VideoCard(video: recommendedList[index]))
            : index == recommendedList.length - 1
                ? Padding(padding: EdgeInsets.only(right: 20.w), child: VideoCard(video: recommendedList[index]))
                : VideoCard(video: recommendedList[index])
      ),
    );
  }
}
