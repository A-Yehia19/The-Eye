// submit_child.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Pages/Add%20Child/Widgets/add_child_form.dart';
import 'package:the_eye/Pages/Add%20Child/Widgets/choose_content.dart';
import '../../../Common/Firebase/Firestore/create new user.dart';
import '../../../Common/Models/Classes/Child.dart'; // Import the Child class

void submit(GlobalKey<AddChildFormState> formKey, GlobalKey<ChooseChildContentState> contentKey, BuildContext context) async {
  final formState = formKey.currentState;
  final contentState = contentKey.currentState;

  if (formState != null && contentState != null) {
    final name = formState.nameController.text;
    final age = formState.ageController.text;
    final pin = "1111"; // Get the pin from the form
    final gender = formState.selectedGender.toString().split('.').last; // Convert Gender enum to String
    final categories = contentState.categories;
    final isSelected = contentState.isSelected;

    // Get the parent's UID
    final parentID = FirebaseAuth.instance.currentUser!.uid;

    // Create a new document in the Firestore 'users' collection for the child user
    final childDocRef = FirebaseFirestore.instance.collection('users').doc();

    // Get the child's UID
    final childID = childDocRef.id;

    // Create a new instance of the Child class
    final child = Child(
      id: childID,
      name: name,
      gender: gender,
      parentID: parentID,
      PIN: pin,
      birthDate: age,
      // ... other attributes
    );

    // Set the Firestore document for the child user
    await childDocRef.set(child.toMap()); // Convert the Child instance to a map

    // Update the Firestore document for the parent user
    await FirebaseFirestore.instance.collection('users').doc(parentID).update({
      'children': FieldValue.arrayUnion([childID]),
    });

    // Call the createUser function
    await createUser(childID, name, age, gender, false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Child was added successfully'),
      ),
    );

    // Wait for a short delay before popping the page
    await Future.delayed(Duration(seconds: 2));

    // Pop the current page from the navigation stack
    Navigator.pop(context);

    // Here you can handle the submission of the data
    // For example, you can print the data
    print('Name: $name');
    print('Age: $age');
    print('Pin: $pin');
    print('Gender: $gender');
    for (int i = 0; i < categories.length; i++) {
      print('Category: ${categories[i]}, Selected: ${isSelected[i]}');
    }
  }
}