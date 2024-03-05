import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Pages/Videos%20Home/Data/Variables.dart';

import 'Video Card.dart';

class RecommendedVideos extends StatelessWidget {
  const RecommendedVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsetsDirectional.zero,
        itemCount: videosList.length,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) => VideoCard(video: videosList[index]),
      ),
    );
  }
}