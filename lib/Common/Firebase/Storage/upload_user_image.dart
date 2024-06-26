import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

Future<String> uploadUserImage(File imageFile, String userID) async {
  Reference storageReference = FirebaseStorage.instance.ref().child('profile_pics/$userID');

  // Upload the file to Firebase Storage
  await storageReference.putFile(imageFile, SettableMetadata(contentType: 'image/jpeg'));
  return await storageReference.getDownloadURL();
}