import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Data/Functions/Recommended Videos Fetch.dart';
import 'Recommended Video Card.dart';

class OtherVideos extends StatelessWidget {
  const OtherVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215.h,
      width: double.infinity,
      child: FutureBuilder(
        future: getRecommendedVideos(),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return const Center(child: CircularProgressIndicator());
          }
          final videoList = snapshot.data!;
          return ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsetsDirectional.zero,
              itemCount: videoList.length,
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemBuilder: (context, index) {
                if (index == 0){
                  // first video card
                  return Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: VideoCard(video: videoList[index])
                  );
                } else if (index == videoList.length - 1) {
                  // last video card
                  return Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: VideoCard(video: videoList[index])
                  );
                } else {
                  return VideoCard(video: videoList[index]);
                }
              }
          );
        }
      ),
    );
  }
}
