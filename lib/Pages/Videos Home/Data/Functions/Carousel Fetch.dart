import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_eye/Common/Models/Classes/Video.dart';

import '../Variables.dart';

void getCarouselList() async{
  final db = FirebaseFirestore.instance;
  final videosRef = db.collection('videos');

  final videoCollection = await videosRef.get();
  carouselList =  videoCollection.docs.map((video) => Video.fromSnapshot(video)).toList();
  carouselLoaded.value = true;
}
