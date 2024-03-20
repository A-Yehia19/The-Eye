import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constants/Colors.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final Icon? icon; // Optional icon parameter
  final int maxLines; // Added maxLines parameter
  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
    this.icon, // Optional icon parameter
    this.maxLines = 1, // Set default value of maxLines to 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8),
    );
    return TextField(
      controller: textEditingController,
      style: TextStyle(color: textColor, fontSize: 14.sp),
      cursorColor: primaryColor,
      decoration: InputDecoration(
        fillColor: secondaryColor,
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        hintStyle: const TextStyle(color: hintColor, fontSize: 14),
        prefixIcon: icon, // Setting the icon as prefixIcon
        contentPadding: EdgeInsets.symmetric(vertical: 12).copyWith(left: 20), // Adjust the left padding
      ),
      keyboardType: textInputType,
      obscureText: isPass,
      maxLines: maxLines, // Set maxLines of TextField
    );
  }
}