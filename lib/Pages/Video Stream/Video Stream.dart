import 'package:flutter/material.dart';

import '../../Common/Models/Video Class.dart';
import '../../Common/Widgets/Upper Bar.dart';
import '../../Constants/Colors.dart';
import 'Widgets/Other Videos.dart';
import 'Widgets/Video Box.dart';

class VideoStream extends StatelessWidget {
  final Video video;
  const VideoStream({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bubbles.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UpperBar(),
              const SizedBox(height: 28),
              VideoBox(video: video),
              const SizedBox(height: 15),
              const Divider(color: textColor, thickness: 3, endIndent: 12, indent: 12),
              const SizedBox(height: 30),
              const Expanded(child: OtherVideos()),
            ],
          ),
        )
      ),
    );
  }
}
