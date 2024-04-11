import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_eye/Common/Models/Classes/User.dart';
import 'package:the_eye/Constants/links.dart';

Future<User?> getUser(String id) async {
  final db = FirebaseFirestore.instance;
  final userRef = db.collection('users').doc(id);
  final user = await userRef.get();

  if (user.exists) {
    return User(
      id: user.id,
      name: user.data()!['name'] ?? "",
      gender: user.data()!['gender'] ?? "",
      role: user.data()!['role'] ?? "",
      imageURL: user.data()!['imageURL'] != "" ? user.data()!['imageURL'] : profilePlaceholderURL,
    );
  }

  return null;
  // todo: make it cast according to role
}