import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_eye/Common/Models/Classes/Video.dart';

Future<List<Video>> getRecommendedVideos() async{
  final db = FirebaseFirestore.instance;
  final videosRef = db.collection('videos');

  final videoCollection = await videosRef.get();
  return videoCollection.docs.map((video) => Video.fromSnapshot(video)).toList();
}
