import 'package:flutter/material.dart';

InputDecorationTheme inputDecorationThemeTheme = const InputDecorationTheme(
  outlineBorder: BorderSide(style: BorderStyle.none),
  border: OutlineInputBorder(
    borderSide: BorderSide(style: BorderStyle.none),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(style: BorderStyle.none),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2, strokeAlign: BorderSide.strokeAlignCenter),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 2, strokeAlign: BorderSide.strokeAlignCenter),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  errorStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),


  fillColor: Colors.white,
  filled: true,
  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
  labelStyle: TextStyle(fontSize: 14),
  floatingLabelBehavior: FloatingLabelBehavior.never,
);
