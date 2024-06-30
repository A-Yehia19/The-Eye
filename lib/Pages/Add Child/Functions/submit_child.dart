import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Common/Firebase/Storage/upload_user_image.dart';
import 'package:the_eye/Pages/Add%20Child/Widgets/add_child_form.dart';
import 'package:the_eye/Pages/Add%20Child/Widgets/choose_content.dart';
import '../../../Common/Models/Classes/Child.dart';

import '../../Signup/Data/Functions/set_parent_pin.dart';

// submit_child.dart
Future<void> submit(File? imageFile, GlobalKey<AddChildFormState> formKey, GlobalKey<ChooseChildContentState> contentKey, BuildContext context) async {
  // for debugging
  print('submit function called');
  print('imageFile in submit function: $imageFile');

  final formState = formKey.currentState;
  final contentState = contentKey.currentState;

  if (formState != null && contentState != null) {
    final name = formState.nameController.text;
    final gender = formState.selectedGender.toString().split('.').last; // Convert Gender enum to String
    final categories = contentState.isSelected;

    DateTime? age;
    if (formState.ageController.text is Timestamp) {
      age = (formState.ageController.text as Timestamp).toDate();
    } else {
      try {
        age = DateTime.parse(formState.ageController.text);
      } catch (e) {
        print('Error parsing date: $e');
      }
    }

    // Get the parent's UID
    final parentID = FirebaseAuth.instance.currentUser!.uid;

    // Create a new document in the Firestore 'users' collection for the child user
    final childDocRef = FirebaseFirestore.instance.collection('users').doc();

    // Get the child's UID
    final childID = childDocRef.id;

    // Call openSetParentPin and get the PIN
    Completer<int> pinCompleter = Completer<int>();
    openSetParentPin(context, pinCompleter);
    int pin = await pinCompleter.future;

    // Create a new instance of the Child class
    final child = Child(
      id: childID,
      name: name,
      gender: gender,
      parentID: parentID,
      PIN: pin,
      birthDate: age ?? DateTime.now(),
      prefs: categories,
    );

    // Set the Firestore document for the child user
    await childDocRef.set(child.toMap()); // Convert the Child instance to a map

    // Update the Firestore document for the parent user
    await FirebaseFirestore.instance.collection('users').doc(parentID).update({
      'children': FieldValue.arrayUnion([childID]),
    });

    // Call the createUser function
    //await createUser(childID, name, age, gender, false);

    // Check if an image was selected
    if (imageFile != null) {
      final imageUrl = await uploadUserImage(imageFile, childID);
      await childDocRef.update({'imageURL': imageUrl});
    }else{
      print("No image selected!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11");
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Child was added successfully'),
      ),
    );

    // Pop the current page from the navigation stack
    Navigator.pop(context);

  }else{
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please fill in all the fields'),
      ),
    );
  }
}