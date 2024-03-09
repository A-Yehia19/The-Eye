import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Common/Widgets/Back.dart';

class AddChildAppBar extends StatelessWidget {
  const AddChildAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding( // Add padding around the back button
          padding: EdgeInsets.all(10.w),
          child: Back(),
        ),
        Padding( // Add padding around the image
          padding: EdgeInsets.all(10.w),
          child: GestureDetector(
            onTap: () {
              // Add your logic here
            },
            child: Container(
              width: 50, // Increase the width of the image
              height: 50, // Increase the height of the image
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.w),
                borderRadius: BorderRadius.circular(8.w), // Add rounded borders to the image
                image: DecorationImage(
                  image: AssetImage("assets/images/ali.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
