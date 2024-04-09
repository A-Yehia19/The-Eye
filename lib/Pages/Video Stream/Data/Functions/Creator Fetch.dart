import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, dynamic>?> getCreator(String UID) async{
  final db = FirebaseFirestore.instance;
  final creatorRef = db.collection('users').doc(UID);

  final creator = await creatorRef.get();
  return creator.data();
}
