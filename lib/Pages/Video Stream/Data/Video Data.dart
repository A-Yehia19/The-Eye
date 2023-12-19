import 'package:the_eye/Pages/Video%20Stream/Data/Variables.dart';
import 'package:video_player/video_player.dart';


late VideoPlayerController videoController;

// function represent tapping on video thumbnail
// play the video if stopped and vice versa
playPauseVideo() {
  print('pressed');
  if (videoController.value.isPlaying) {
    videoController.pause();
    videoNotifier.value = false;
  } else {
    videoController.play();
    videoNotifier.value = true;
  }
}
