import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../Common/Models/Video Class.dart';
import '../Data/Variables.dart';
import '../Data/Video Data.dart';

class VideoBox extends StatelessWidget {
  final Video video;
  const VideoBox({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    print(video.url);
    videoController = VideoPlayerController.networkUrl(Uri.parse(video.url))
      ..initialize().then((_) {
        videoController.play();
        videoController.setLooping(true);
        videoNotifier.value = true;
      });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 225,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: ValueListenableBuilder(
              valueListenable: videoNotifier,
              builder: (context, value, child) {
                if (value) {
                  return GestureDetector(
                    onTap: () => playPauseVideo(),
                    child: VideoPlayer(videoController),
                  );
                } else {
                  return Container(
                    color: Colors.grey,
                    child: const Center(child: CircularProgressIndicator(color: Colors.blueAccent))
                  );
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          video.caption,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)
        ),
      ],
    );
  }
}
