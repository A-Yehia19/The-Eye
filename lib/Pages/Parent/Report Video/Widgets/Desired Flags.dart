import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Parent/Report%20Video/Data/Variables.dart';

class DesiredFlags extends StatefulWidget {
  const DesiredFlags({super.key});

  @override
  State<DesiredFlags> createState() => _DesiredFlagsState();
}

class _DesiredFlagsState extends State<DesiredFlags> {
  @override
  Widget build(BuildContext context) {
    final List<String> categories = ['Nudity', 'Violence', 'Weapons', 'LGBTQ', 'Disgusting', 'Sexual', 'Blood'];

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          padding: EdgeInsets.all(15.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black,
              width: 1.5,
            ),
          ),
          child: Wrap(
            children: categories.map((category) => Padding(
              padding: EdgeInsets.symmetric( horizontal: 2.w, vertical: 4.w),
              child: ChoiceChip(
                label: Text(category),
                selected: reportedFlags.contains(category),
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      reportedFlags.add(category);
                    } else {
                      reportedFlags.remove(category);
                    }
                  });
                },
                selectedColor: primaryColor,
                backgroundColor: Colors.grey[200], // Lighter grey color for deactivated state
                labelStyle: TextStyle(color: reportedFlags.contains(category) ? Colors.white : Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50), // Rounder borders
                ),
              ),
            )).toList(),
          ),
        ),
        Positioned(
          top: -10,
          left: 25.w,
          child: Text(
            ' Proposed Flags',
            style: TextStyle(
              color: textColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
