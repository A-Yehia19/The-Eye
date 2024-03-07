import 'package:flutter/material.dart';
import 'package:the_eye/Pages/Video%20Stream/Data/Variables.dart';

import 'Recommended Video Card.dart';

class OtherVideos extends StatelessWidget {
  const OtherVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsetsDirectional.zero,
      itemCount: recommendedList.length,
      separatorBuilder: (context, index) => const SizedBox(width: 20),
      itemBuilder: (context, index) => VideoCard(video: recommendedList[index]),
    );
  }
}
