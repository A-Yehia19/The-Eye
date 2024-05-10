import 'package:flutter/material.dart';
import 'package:the_eye/Common/Models/Classes/Creator.dart';

import 'creator_video_card.dart';

class UploadsList extends StatelessWidget {
  final List<String> videosList;
  final Creator creator;
  const UploadsList({super.key, required this.videosList, required this.creator});

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
              CreatorVideoCard(videoID: videosList[index], creator: creator,),
              const SizedBox(height: 20),
            ],
          ),
        ),
    ): const Center(child: Text('No Videos Found', style: TextStyle(color: Colors.grey),),),
    );
  }
}
