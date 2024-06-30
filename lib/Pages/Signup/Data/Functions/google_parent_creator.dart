import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Common/Widgets/Custom Radio.dart';
import '../../../../Constants/Colors.dart';

void openGoogleParentCreator(context, Completer<int> pinCompleter) {
  // Create a list of focus nodes
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  // Create a list to store the entered digits
  List<String> digits = List.generate(4, (index) => "");
  bool isParent = true;

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
                side: const BorderSide(color: primaryColor),
              ),
            ),
          ),
          child: AlertDialog(
            title: const Text('Enter new profile PIN'),
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
                if(isParent) ...[
                  SizedBox(height: 25.w),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign up as:",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomRadio(
                        value: true,
                        groupValue: isParent,
                        onChanged: (value) {
                          setState(() {
                            isParent = value;
                          });
                        },
                      ),
                      const Text("Parent",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 40.w,),
                      CustomRadio(
                        value: false,
                        groupValue: isParent,
                        onChanged: (value) {
                          setState(() {
                            isParent = value;
                          });
                        },
                      ),
                      const Text("Creator",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
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
                      // Get the entered PIN
                      int pin = int.tryParse(digits.join()) ?? 0;

                      // Complete the completer with the PIN
                      pinCompleter.complete(pin);

                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Create account",
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