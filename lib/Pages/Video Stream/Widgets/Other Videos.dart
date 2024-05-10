import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/User.dart';

import '../Data/Functions/Recommended Videos Fetch.dart';
import 'Recommended Video Card.dart';

class OtherVideos extends StatelessWidget {
  final User user;
  const OtherVideos({super.key, required this.user});

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
                    child: VideoCard(video: videoList[index], user: user,)
                  );
                } else if (index == videoList.length - 1) {
                  // last video card
                  return Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: VideoCard(video: videoList[index], user: user,)
                  );
                } else {
                  return VideoCard(video: videoList[index], user: user,);
                }
              }
          );
        }
      ),
    );
  }
}
