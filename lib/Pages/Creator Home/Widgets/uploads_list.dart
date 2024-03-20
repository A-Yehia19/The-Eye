import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Video%20Stream/Widgets/Recommended%20Video%20Card.dart';
import 'package:the_eye/Pages/Videos%20Home/Data/Variables.dart';

import '../Data/variables.dart';
import 'creator_video_card.dart';

class UploadsList extends StatelessWidget {
  const UploadsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: videosList.isNotEmpty
    ? Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          padding: EdgeInsetsDirectional.zero,
          itemCount: videosList.length,
          separatorBuilder: (context, index) => const SizedBox(width: 20),
          itemBuilder: (context, index) => Column(
            children: [
              CreatorVideoCard(video: videosList[index]),
              SizedBox(height: 20),
            ],
          ),
        ),
    ): Center(child: Text('No Videos Found', style: TextStyle(color: Colors.grey),),),
    );
  }
}
