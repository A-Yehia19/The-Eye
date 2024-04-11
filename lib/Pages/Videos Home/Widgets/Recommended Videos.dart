import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Data/Functions/Videos Fetch.dart';
import 'Video Card.dart';

class RecommendedVideos extends StatelessWidget {
  const RecommendedVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      width: double.infinity,
      child: FutureBuilder(
        future: getVideosList(),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsetsDirectional.zero,
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemBuilder: (context, index) => VideoCard(video: snapshot.data![index]),
            );
          }
        },
      ),
    );
  }
}