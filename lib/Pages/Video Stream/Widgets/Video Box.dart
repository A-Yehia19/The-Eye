import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import 'package:the_eye/Common/Models/Classes/Video.dart';

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
      playVideoFrom: PlayVideoFrom.network(widget.video.videoURL),
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
    return PodVideoPlayer(
      controller: videoController,
      matchVideoAspectRatioToFrame: true,
      videoThumbnail: DecorationImage(
        image: NetworkImage(widget.video.thumbnail),
        fit: BoxFit.cover,
      ),
    );
  }
}
