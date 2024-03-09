import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Constants/Colors.dart';
import '../../Videos Home/Data/Variables.dart';

void openDialog(context, name, imageURL) {
  // Create a list of focus nodes
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  // Create a list to store the entered digits
  List<String> digits = List.generate(4, (index) => "");

  // Create a boolean to control the display of the loading indicator
  bool isLoading = false;

  showDialog(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: AlertDialog(
          contentPadding: EdgeInsets.all(20.w),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 75.w,
                backgroundColor: primaryColor,
                child: CircleAvatar(
                  radius: 70.w,
                  backgroundImage: AssetImage(imageURL),
                ),
              ),
              SizedBox(height: 10.w),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.w,
                ),
              ),
              SizedBox(height: 30.w),
              Text(
                "Enter profile ID",
                style: TextStyle(
                  fontSize: 20.w,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) => Container(
                  height: 45.w, // Set a specific height for the TextField
                  width: 40.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [ // Add a shadow
                      BoxShadow(
                        color: primaryColor.withOpacity(1),
                        spreadRadius: 1.w,
                      ),
                    ],
                  ),
                  child: TextField(
                    focusNode: focusNodes[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                    ),
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      digits[index] = value;
                      if (value.length == 1 && index < 3) {
                        // When a digit is entered, move focus to the next TextField
                        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                      }
                    },
                  ),
                )).toList(),
              ),
              SizedBox(height: 25.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                  ),
                  onPressed: () {
                    if (digits.join().length == 4) {
                      setState(() {
                        isLoading = true;
                      });
                      username = name;
                      userImage = imageURL;
                      Navigator.pushNamed(context, '/videoHome');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter a valid ID')),
                      );
                    }
                  },
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.w,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}