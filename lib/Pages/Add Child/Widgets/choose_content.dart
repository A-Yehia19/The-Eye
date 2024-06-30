// choose_content.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Common/Widgets/button_widget.dart'; // Import the CustomButton widget

class ChooseChildContent extends StatefulWidget {
  const ChooseChildContent({super.key});

  @override
  ChooseChildContentState createState() => ChooseChildContentState();
}

class ChooseChildContentState extends State<ChooseChildContent> {
  final List<String> categories = ['Nudity', 'Violence', 'Weapons', 'LGBTQ', 'Disgusting', 'Sexual', 'Blood'];
  List<String> isSelected = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.h,),
        Align( // Wrap the Text widget in an Align widget
          alignment: Alignment.centerLeft, // Align the text to the left
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: const Text(
              'Select allowed content',
              style: TextStyle(
                color: primaryColor,
                fontSize: 20, // Set the text size to 20
                fontWeight: FontWeight.bold, // Increase the boldness
              ),
            ),
          ),
        ),
        Wrap(
          children: categories.map((category) => Padding(
            padding: EdgeInsets.symmetric( horizontal: 2.w, vertical: 4.w),
            child: ChoiceChip(
              label: Text(category),
              selected: isSelected.contains(category),
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    isSelected.add(category);
                  } else {
                    isSelected.remove(category);
                  }
                });
              },
              selectedColor: primaryColor,
              backgroundColor: Colors.grey[200], // Lighter grey color for deactivated state
              labelStyle: TextStyle(color: isSelected.contains(category) ? Colors.white : Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50), // Rounder borders
              ),
            ),
          )).toList(),
        ),
        Padding(
          padding:EdgeInsets.only(left: 15.w),
          child: Row( // Wrap the buttons in a Row widget
            mainAxisAlignment: MainAxisAlignment.start, // Align the buttons to the left
            children: [
              CustomButton(
                onPressed: () {
                  setState(() {
                    isSelected = List.from(categories);
                  });
                },
                child: const Text( // Set the text to 'Select All'
                  'Select All',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(width: 10.w), // Add some space between the buttons
              CustomButton(
                onPressed: () {
                  setState(() {
                    isSelected.clear();
                  });
                },
                child: const Text('Deselect All',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(), // Pushes the buttons to the left
            ],
          ),
        ),
      ],
    );
  }
}