// add_child_form.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Widgets/input_text_field.dart';
import 'package:the_eye/Common/Widgets/set_user_profile_pic.dart';
import 'package:the_eye/Constants/Colors.dart';

enum Gender { male, female }

class AddChildForm extends StatefulWidget {
  final GlobalKey<UserProfilePicState>
      picKey; // Add photoKey to the constructor
  AddChildForm({Key? key, required this.picKey})
      : super(key: key); // Add photoKey to the constructor

  @override
  AddChildFormState createState() => AddChildFormState();
}

class AddChildFormState extends State<AddChildForm> {
  Gender? selectedGender;
  String? passwordError;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<bool> validatePassword(String password) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser != null) {
      var authCredentials = EmailAuthProvider.credential(
          email: firebaseUser.email!, password: password);

      try {
        var authResult =
            await firebaseUser.reauthenticateWithCredential(authCredentials);
        return authResult.user != null;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          return false;
        } else {
          throw e;
        }
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
          child: const Text(
            'Add Account',
            style: TextStyle(
              color: primaryColor, // Set the text color to primaryColor
              fontWeight: FontWeight.bold, // Make the text bold
              fontSize: 24, // Set the text size to 24
            ),
          ),
        ),
        UserProfilePic(
          key: widget.picKey,
        ), // Add the UserProfilePic widget
        Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceAround, // Distribute the free space evenly around the children
          children: [
            Expanded(
              child: RadioListTile<Gender>(
                title: const Text('Male'),
                value: Gender.male,
                groupValue: selectedGender,
                activeColor:
                    highlightColor, // Set the active color to highlightColor
                onChanged: (Gender? value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<Gender>(
                title: const Text('Female'),
                value: Gender.female,
                groupValue: selectedGender,
                activeColor:
                    highlightColor, // Set the active color to highlightColor
                onChanged: (Gender? value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFieldInput(
              textEditingController: nameController,
              hintText: 'Child\'s Name',
              textInputType: TextInputType.text,
              icon: const Icon(Icons.person, color: primaryColor),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFieldInput(
              textEditingController: ageController,
              hintText: 'Birth Date',
              icon: const Icon(Icons.cake, color: primaryColor),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  ageController.text = date
                      .toIso8601String()
                      .substring(0, 10); // Format the date as yyyy-mm-dd
                }
              },
              textInputType: TextInputType.datetime,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFieldInput(
              textEditingController: passwordController,
              hintText: 'Password',
              textInputType: TextInputType.visiblePassword,
              isPass: true,
              icon: const Icon(Icons.lock, color: primaryColor),
              onChanged: (value) async {
                if (value.isEmpty) {
                  setState(() {
                    passwordError = 'Please enter your password';
                  });
                } else if (!await validatePassword(value)) {
                  setState(() {
                    passwordError = 'Incorrect password';
                  });
                } else {
                  setState(() {
                    passwordError = null;
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
