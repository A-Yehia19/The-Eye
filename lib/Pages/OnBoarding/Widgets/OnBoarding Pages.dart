import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Constants/Colors.dart';

import '../Data/Variables.dart';

class OnBoardingPages extends StatelessWidget {
  const OnBoardingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        itemCount: onboardingImages.length,
        onPageChanged: (index) => currentPage.value = index,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(onboardingImages[index])),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.w),
              child: Text.rich(
                style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600, color: textColor),
                const TextSpan(
                  children: [
                    TextSpan(text: 'Welcome '),
                    TextSpan(text: 'To\n', style: TextStyle(color: highlightColor)),
                    TextSpan(text: 'the '),
                    TextSpan(text: 'Eye', style: TextStyle(color: customPink)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.w),
              child: Text(onboardingDescriptions[index],
                  style: TextStyle(fontSize: 15.7.sp, fontWeight: FontWeight.w500, color: textColor)),
            ),
          ],
        ),

      ),
    );
  }
}
