import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';
import 'package:the_eye/Constants/links.dart';
import 'package:the_eye/Pages/Videos%20Home/Videos%20Home.dart';
import '../../../Common/Models/Classes/Child.dart';
import '../../../Constants/Colors.dart';
import '../../Parent/Parent Home/Parent Home.dart';

void openDialog(context, user) {
  // Create a list of focus nodes
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  // Create a list to store the entered digits
  List<String> digits = List.generate(4, (index) => "");

  showDialog(
    context: context,
    builder: (context) => BackdropFilter(
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
                backgroundImage: (user.imageURL != null && user.imageURL.isNotEmpty)
                    ? NetworkImage(user.imageURL) as ImageProvider<Object>
                    : const AssetImage(profilePlaceholderAsset),
              ),
            ),
            SizedBox(height: 10.w),
            Text(
              user.name,
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
                  decoration: const InputDecoration(
                    counterText: '',
                  ),
                  textAlignVertical: TextAlignVertical.top,
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
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.w),
                  ),
                ),
                onPressed: () {
                  // Get the entered PIN
                  int enteredPin = int.tryParse(digits.join()) ?? 0;

                  // Validate the entered PIN
                  if ((user is Parent && user.PIN == enteredPin) || (user is Child && user.PIN == enteredPin)) {
                    Navigator.of(context).pop();

                    if (user.role == "parent") {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ParentHome(parent: user as Parent,)));
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VideosHome(user: user)));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid PIN. Please try again.')),
                    );
                  }
                },
                child: Text(
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
  );
}