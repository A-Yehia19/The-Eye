import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constants/Colors.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final Icon? icon;
  final int maxLines;
  final Future<Null> Function()? onTap; // Make onTap optional
  final void Function(String)? onChanged; // Add optional onChanged function

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
    this.icon,
    this.maxLines = 1,
    this.onTap, // No need to provide a default value
    this.onChanged, // No need to provide a default value
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
        prefixIcon: icon,
        contentPadding: EdgeInsets.symmetric(vertical: 12).copyWith(left: 20),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
      maxLines: maxLines,
      onTap: onTap, // Use the optional onTap function
      onChanged: onChanged, // Use the optional onChanged function
    );
  }
}