import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.hintText,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
      borderRadius: BorderRadius.circular(15.r),
    );
    return TextField(
      controller: textEditingController,
      style: TextStyle(color: Colors.black, fontSize: 24.sp),
      cursorColor: Colors.blueAccent,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        hintStyle: const TextStyle(color: Colors.grey),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
