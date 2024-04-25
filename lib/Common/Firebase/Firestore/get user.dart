import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_eye/Common/Models/Classes/User.dart';
import 'package:the_eye/Constants/links.dart';

import '../../Models/Classes/Child.dart';
import '../../Models/Classes/Creator.dart';
import '../../Models/Classes/Parent.dart';

Future<User?> getUser(String id) async {
  try {
    final db = FirebaseFirestore.instance;
    final userRef = db.collection('users').doc(id);
    final user = await userRef.get();

    if (user.exists) {
      print('User exists with id: $id');
      String role = user.data()!['role'] ?? "";

      // Check the role and return the appropriate class instance
      switch (role) {
        case 'parent':
          if (user.data() != null) {
            print('User role is parent');
            return Parent(
              id: user.id,
              name: user.data()!['name'] ?? "",
              gender: user.data()!['gender'] ?? "",
              imageURL: user.data()!['imageURL'] != "" ? user.data()!['imageURL'] : profilePlaceholderURL,
              email: user.data()!['email'] ?? "",
            );
          } else {
            print('User data is null for parent');
            throw Exception('User data is null');
          }
        case 'creator':
          if (user.data() != null) {
            print('User role is creator');
            return Creator(
              id: user.id,
              name: user.data()!['name'] ?? "",
              gender: user.data()!['gender'] ?? "",
              imageURL: user.data()!['imageURL'] != "" ? user.data()!['imageURL'] : profilePlaceholderURL,
              email: user.data()!['email'] ?? "",
            );
          } else {
            print('User data is null for creator');
            throw Exception('User data is null');
          }
        case 'child':
          if (user.data() != null) {
            print('User role is child');
            return Child(
              id: user.id,
              name: user.data()!['name'] ?? "",
              gender: user.data()!['gender'] ?? "",
              imageURL: user.data()!['imageURL'] != "" ? user.data()!['imageURL'] : profilePlaceholderURL,
              parentID: user.data()!['parentID'] ?? "",
              PIN: user.data()!['PIN'] ?? "",
              birthDate: user.data()!['birthDate'] ?? "",

            );
          } else {
            print('User data is null for child');
            throw Exception('User data is null');
          }
        default:
          print('Invalid role: $role');
          throw Exception('Invalid role');
      }
    } else {
      print('No user found with id: $id');
      return null;
    }
  } catch (e) {
    print('Error getting user: $e');
    return null;
  }
}