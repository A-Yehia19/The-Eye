import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/OnBoarding/Data/Variables.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 80.r,
          width: 80.r,
          child: ValueListenableBuilder(
            valueListenable: currentPage,
            builder: (context, value, child) => TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: (value + 1) / onboardingImages.length),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, child) => CircularProgressIndicator(
                value: value,
                color: highlightColor,
                backgroundColor: secondaryColor,
                strokeWidth: 2,
              ),
            ),
          ),
        ),
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {
            if (currentPage.value < onboardingImages.length - 1) {
              pageController.animateToPage(
                  currentPage.value + 1,
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 500),
              );
            } else {
              SharedPreferences.getInstance().then((prefs) => prefs.setBool('seen', true));
              Navigator.pushNamedAndRemoveUntil(context, '/started', (route) => false);
            }
          },
          child: Container(
            height: 60.r,
            width: 60.r,
            decoration: const BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
