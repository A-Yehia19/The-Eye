import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';
import 'package:the_eye/Common/Widgets/button_widget.dart';
import 'package:the_eye/Common/Widgets/input_text_field.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Parent/Report%20Video/ReportVideo.dart';
import 'package:the_eye/Pages/Payment/payment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void showChangeUsernameDialog(BuildContext context) {
  final TextEditingController usernameController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  showDialog(
    context: context,
    builder: (context) {
      return Theme(
        data: Theme.of(context).copyWith(
          dialogBackgroundColor: Colors.white,
          dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: primaryColor),
            ),
          ),
        ),
        child: AlertDialog(
          title: Text('Change Username'),
          content: TextFieldInput(
            textEditingController: usernameController,
            hintText: 'New Username',
            textInputType: TextInputType.text,
          ),
          actions: [
            TextButton(
              child: Text('Cancel',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold)),
              onPressed: () async {
                // Update the display name in Firebase Authentication
                await user?.updateProfile(displayName: usernameController.text);

                // Update the username in Firestore
                FirebaseFirestore.instance.collection('users').doc(user?.uid).update({
                  'name': usernameController.text,
                });

                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}

void showChangePasswordDialog(BuildContext context) {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  showDialog(
    context: context,
    builder: (context) {
      return Theme(
        data: Theme.of(context).copyWith(
          dialogBackgroundColor: Colors.white,
          dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: primaryColor),
            ),
          ),
        ),
        child: AlertDialog(
          title: Text('Change Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFieldInput(
                textEditingController: oldPasswordController,
                hintText: 'Old Password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFieldInput(
                textEditingController: newPasswordController,
                hintText: 'New Password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFieldInput(
                textEditingController: confirmPasswordController,
                hintText: 'Confirm New Password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold)),
              onPressed: () async {
                if (newPasswordController.text == confirmPasswordController.text) {
                  // Update the password in Firebase Authentication
                  await user?.updatePassword(newPasswordController.text);
                  Navigator.of(context).pop();
                } else {
                  // Show an error message
                }
              },
            ),
          ],
        ),
      );
    },
  );
}

void showDeleteAccountDialog(BuildContext context) {
  final TextEditingController deleteController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  showDialog(
    context: context,
    builder: (context) {
      return Theme(
        data: Theme.of(context).copyWith(
          dialogBackgroundColor: Colors.white,
          dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.redAccent),
            ),
          ),
        ),
        child: AlertDialog(
          title: Text('Are you sure?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Type "Delete my account" to delete your account',
                  style: TextStyle(color: textColor, fontSize: 14.sp)),
              SizedBox(height: 10.w),
              TextFieldInput(
                textEditingController: deleteController,
                hintText: 'Delete my account',
                textInputType: TextInputType.text,
              ),
            ],
          ),
          actions: [
            CustomButton(
              buttonColor: Colors.redAccent,
              child: Text(
                'Delete',
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                if (deleteController.text == 'Delete my account') {
                  // Delete the user from Firestore
                  await FirebaseFirestore.instance.collection('users').doc(user?.uid).delete();

                  // Delete the user from Firebase Authentication
                  await user?.delete();

                  // Navigate to the Start page
                  Navigator.pushNamedAndRemoveUntil(context, '/start', (route) => false);
                } else {
                  // Show an error message
                }
              },
            ),
          ],
        ),
      );
    },
  );
}

void reportVideo(BuildContext context, Parent parent) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ReportVideo(parent: parent, videoID: '')));
}

void removeADs(BuildContext context, Parent parent) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => Payment(parent: parent)));
}
