// start_buttons.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Widgets/button_widget.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Login/login.dart'; // Import the login_functions.dart file
import 'package:the_eye/Pages/Signup/signup.dart'; // Import the signup.dart file

class StartButtons extends StatelessWidget {
  const StartButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()), // Navigate to the Login page
                  );
                },
                buttonColor: Colors.white,
                buttonDecoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 8.h),
                  child: Text('Sign In', style: TextStyle(color: primaryColor, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                ),
              ),
              CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signup()), // Navigate to the Signup page
                  );
                },
                buttonColor: primaryColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 8.h),
                  child: Text('Register', style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}