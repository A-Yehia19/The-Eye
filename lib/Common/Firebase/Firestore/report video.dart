import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

reportVideoFirebase(reportedFlags, reportVideoID, reportTitle, reportDescription) async {
  await FirebaseFirestore.instance.collection('reports').add({
    'parentID': FirebaseAuth.instance.currentUser!.uid,
    'VideoID': reportVideoID,
    'Flags': reportedFlags,
    'Title': reportTitle,
    'Description': reportDescription,
    'date': DateTime.now(),
  });
}
