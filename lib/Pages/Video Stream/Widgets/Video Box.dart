import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

import '../../../Common/Models/Video Class.dart';

class VideoBox extends StatefulWidget {
  final Video video;
  const VideoBox({super.key, required this.video});

  @override
  State<VideoBox> createState() => _VideoBoxState();
}

class _VideoBoxState extends State<VideoBox> {
  late final PodPlayerController videoController;

  @override
  void initState() {
    // start playing video
    videoController = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(widget.video.url),
      podPlayerConfig: const PodPlayerConfig(
        videoQualityPriority: [480, 360, 720],
        autoPlay: true,
        isLooping: true,
      ),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 225,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PodVideoPlayer(
              controller: videoController,
              videoThumbnail: DecorationImage(
                image: NetworkImage(widget.video.thumbnail),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          widget.video.caption,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)
        ),
      ],
    );
  }
}
