import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Widgets/button_widget.dart';
import 'package:the_eye/Common/Widgets/input_text_field.dart';
import 'package:the_eye/Constants/Colors.dart';

void openChangeIdDialog(context) {
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
        child: Theme(
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
            title: Text('Enter new profile ID'),
            contentPadding: EdgeInsets.all(20.w),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                        borderRadius: BorderRadius.circular(15.w),
                      ),
                    ),
                    onPressed: () {
                      // Implement your logic here
                    },
                    child: isLoading
                        ? const CircularProgressIndicator()
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
    ),
  );
}

void showDeleteChildDialog(BuildContext context) {
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
              Text('Type "Delete child account" to delete child account',
                  style: TextStyle(color: textColor, fontSize: 14.sp)),
              SizedBox(height: 10.w), // Add some space between the text and the TextField (optional
              TextFieldInput(
                textEditingController: deleteController,
                hintText: 'Delete child account',
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
