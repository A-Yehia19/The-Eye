import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';
import 'package:the_eye/Common/Widgets/button_widget.dart';
import 'package:the_eye/Common/Widgets/input_text_field.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Parent/Report%20Video/ReportVideo.dart';
import 'package:the_eye/Pages/Payment/payment.dart';

void showChangeUsernameDialog(BuildContext context) {
  final TextEditingController usernameController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return Theme(
        data: Theme.of(context).copyWith(
          dialogBackgroundColor: Colors.white,
          dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(15), // Increase borderRadius value
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
              onPressed: () {
                // Implement your logic to change the username here
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
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return Theme(
        data: Theme.of(context).copyWith(
          dialogBackgroundColor: Colors.white,
          dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(15), // Increase borderRadius value
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
                textEditingController: passwordController,
                hintText: 'Old Password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFieldInput(
                textEditingController: passwordController,
                hintText: 'New Password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFieldInput(
                textEditingController: passwordController,
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
              onPressed: () {
                if (passwordController.text == confirmPasswordController.text) {
                  // Implement your logic to change the password here
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

  showDialog(
    context: context,
    builder: (context) {
      return Theme(
        data: Theme.of(context).copyWith(
          dialogBackgroundColor: Colors.white,
          dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(15), // Increase borderRadius value
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
              onPressed: () {
                if (deleteController.text == 'Delete my account') {
                  // Implement your logic to delete the account here
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
