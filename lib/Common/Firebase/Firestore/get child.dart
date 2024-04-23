// get child.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Models/Classes/Child.dart';

Future<Child?> getChild(String childID) async {
  try {
    final db = FirebaseFirestore.instance;
    final childRef = db.collection('users').doc(childID);
    final child = await childRef.get();

    if (child.exists) {
      print('Child exists with id: $childID');

      Child? childObject = Child.fromMap(child.data()!); // Use Child.fromMap to create a Child object
      print('Child object: $childObject'); // Print the Child object

      return childObject;
    } else {
      print('No child found with id: $childID');
      return null;
    }
  } catch (e) {
    print('Error getting child: $e');
    return null;
  }
}