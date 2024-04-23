import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:the_eye/Common/AWS/Storage/remove%20file.dart';

void deleteVideoFirebase(videoID, thumbnailExtension, videoExtension) {
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  final UID = FirebaseAuth.instance.currentUser!.uid;
  db.collection('videos').doc(videoID).delete();
  try {
    storage.ref().child('thumbnails/$UID/$videoID.$thumbnailExtension').delete();
  } catch (e) {
    print('thumbnail not found');
  }
  try {
    removeFileAWS(key: 'videos/$UID/$videoID.$videoExtension');
  } catch (e) {
    print('video not found');
  }
}
