import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_eye/Common/AWS/Storage/upload%20file.dart';
import 'package:the_eye/Common/Firebase/Storage/upload%20file.dart';

createVideo(creatorID, title, description, thumbnailPath, videoPath) async {
  final db = FirebaseFirestore.instance;

  Map<String, dynamic> videoData = {
    "creatorID": creatorID,
    "title": title,
    "description": description,
    "date": DateTime.now(),
    "views": 0,
    "status": "pending",
    "comments": [],
  };

  db.collection('videos').add(videoData).then((doc) async {
    final thumbnail = await uploadFileFirebase(thumbnailPath, creatorID, doc.id);
    final videoURL = await uploadFileAWS(videoPath, creatorID, doc.id);
    db.collection('videos').doc(doc.id).update({
      "thumbnail": thumbnail,
      "videoURL": videoURL,
    });
  });
}
