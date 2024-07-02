import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_eye/Common/Functions/Generate%20Prefs%20Options.dart';
import 'package:the_eye/Common/Models/Classes/Video.dart';

Future<List<Video>> getVideosList(List<String> prefs, [String url = ""]) async{
  final queryOptions = generatePrefsOptions(prefs);

  List<List<String>> options1 = queryOptions.sublist(0,28);
  List<List<String>> options2 = queryOptions.sublist(28);

  final db = FirebaseFirestore.instance;
  final videosRef = db.collection('videos');
  final query = videosRef
      .where("status", isEqualTo: "Finished")
      .where("videoURL", isNotEqualTo: url)
      .where(
        Filter.or(
            Filter("tags", whereIn: options1),
            Filter("tags", whereIn: options2)
        )
      );

  final videoCollection = await query.limit(10).get();
  return videoCollection.docs.map((video) => Video.fromSnapshot(video)).toList();
}
