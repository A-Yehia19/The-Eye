import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Firebase/Firestore/Videos%20Fetch.dart';
import 'package:the_eye/Common/Models/Classes/Child.dart';
import 'package:the_eye/Common/Models/Classes/User.dart';

import 'Video Card.dart';

class RecommendedVideos extends StatelessWidget {
  final User user;
  const RecommendedVideos({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final child = user as Child;
    return SizedBox(
      height: 220.h,
      width: double.infinity,
      child: FutureBuilder(
        future: getVideosList(child.prefs),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsetsDirectional.zero,
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemBuilder: (context, index) => VideoCard(video: snapshot.data![index], user: user,),
            );
          }
        },
      ),
    );
  }
}