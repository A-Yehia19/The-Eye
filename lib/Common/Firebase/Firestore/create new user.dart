import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Models/Classes/Child.dart';
import '../../Models/Classes/Creator.dart';
import '../../Models/Classes/Parent.dart';

Future<dynamic> createUser(uid, email, name, String? photo, bool isParent) async {
  final db = FirebaseFirestore.instance;

  // Determine the role based on isParent
  String role = isParent ? 'parent' : 'creator';

  Map<String, dynamic> userData = {
    "email": email,
    "name": name,
    "imageURL": photo ?? "assets/images/profile_placeholder.png", // Set the default imageURL
    "isParent": isParent,
    "role": role,  // Add the role field
  };

  // Determine the collection based on role
  final collection = role == 'child' ? 'children' : 'users';
  final userRef = db.collection(collection).doc(uid);
  final userExists = await userRef.get().then((value) => value.exists);
  if (!userExists) {
    await userRef.set(userData);
  }

  // Retrieve the newly created or existing user document
  DocumentSnapshot userDoc = await userRef.get();

  // Check the role and return the appropriate class instance
  switch (role) {
    case 'parent':
      if (userDoc.data() != null) {
        return Parent.fromMap(userDoc.data() as Map<String, dynamic>);
      } else {
        throw Exception('User data is null');
      }
    case 'creator':
      if (userDoc.data() != null) {
        return Creator.fromMap(userDoc.data() as Map<String, dynamic>);
      } else {
        throw Exception('User data is null');
      }
    case 'child':
      if (userDoc.data() != null) {
        return Child.fromMap(userDoc.data() as Map<String, dynamic>);
      } else {
        throw Exception('User data is null');
      }
    default:
      throw Exception('Invalid role');
  }
}