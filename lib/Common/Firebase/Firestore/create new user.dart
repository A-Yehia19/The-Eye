import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_eye/Constants/links.dart';

import '../../Models/Classes/Creator.dart';
import '../../Models/Classes/Parent.dart';

Future<dynamic> createUser(uid, email, name, String? photo, bool isParent) async {
  final db = FirebaseFirestore.instance;

  // Determine the role based on isParent
  String role = isParent ? 'parent' : 'creator';

  // Create a Parent or Creator object
  var user;
  if (isParent) {
    user = Parent(
      id: uid,
      gender: 'unknown', // Replace with actual gender
      name: name,
      imageURL: profilePlaceholderURL,
      email: email,
    );
  } else {
    user = Creator(
      id: uid,
      gender: 'unknown', // Replace with actual gender
      name: name,
      imageURL: profilePlaceholderURL,
      email: email,
    );
  }

  // Convert the Parent or Creator object to a map
  Map<String, dynamic> userData = user.toMap();

  final userRef = db.collection('users').doc(uid);
  final userExists = await userRef.get().then((value) => value.exists);
  if (!userExists) {
    await userRef.set(userData);
  }

  return user;
}