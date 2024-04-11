import 'package:cloud_firestore/cloud_firestore.dart';

createUser(uid, email, name, String? photo) async {
  final db = FirebaseFirestore.instance;

  Map<String, dynamic> userData = {
    "email": email,
    "name": name,
    "imageURL": photo ?? "",
  };

  final userRef = db.collection("users").doc(uid);
  final userExists = await userRef.get().then((value) => value.exists);
  if (!userExists) {
    userRef.set(userData);
  }
}
