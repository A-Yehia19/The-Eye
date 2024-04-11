import 'package:flutter/material.dart';

import 'creator_video_card.dart';

class UploadsList extends StatelessWidget {
  const UploadsList({super.key});

  @override
  Widget build(BuildContext context) {
    final videosList = [];
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
              const SizedBox(height: 20),
            ],
          ),
        ),
    ): const Center(child: Text('No Videos Found', style: TextStyle(color: Colors.grey),),),
    );
  }
}
