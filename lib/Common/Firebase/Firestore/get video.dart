import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_eye/Common/Models/Classes/Video.dart';

Future<Video?> getVideo(String videoID) async {
  try {
    final db = FirebaseFirestore.instance;
    final videoRef = db.collection('videos').doc(videoID);
    final video = await videoRef.get();

    if (video.exists) {
      return Video.fromSnapshot(video);
    } else {
      print('No video found with id: $videoID');
      return null;
    }
  } catch (e) {
    print('Error getting video: $e');
    return null;
  }
}
