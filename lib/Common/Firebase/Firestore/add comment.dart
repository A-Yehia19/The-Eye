import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_eye/Common/Models/Classes/Comment.dart';

void addCommentFirebase(String videoID, Comment comment)  {
  final db = FirebaseFirestore.instance;
  db.collection('videos').doc(videoID).update({
    'comments': FieldValue.arrayUnion([comment.toMap()])
  });
}
