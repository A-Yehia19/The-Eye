import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Constants/Colors.dart';

class StartBackground extends StatelessWidget {
  const StartBackground({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h), // Use ScreenUtil to set padding
          width: screenWidth,
          child: Image.asset(
            "assets/images/start_bg.png",
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: screenWidth/2 + screenWidth/3,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: 'Experience ', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                  TextSpan(text: 'rich content ', style: TextStyle(color: highlightColor, fontSize: 32, fontWeight: FontWeight.w600)),
                  TextSpan(text: 'for the ', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                  TextSpan(text: 'eyes ', style: TextStyle(color: customPink, fontSize: 32, fontWeight: FontWeight.w600)),
                  TextSpan(text: 'of your ', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                  TextSpan(text: 'Kids', style: TextStyle(color: primaryColor, fontSize: 32, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}