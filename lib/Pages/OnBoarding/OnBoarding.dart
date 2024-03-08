import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Widgets/Next Button.dart';
import 'Widgets/OnBoarding Indicator.dart';
import 'Widgets/OnBoarding Pages.dart';
import 'Widgets/Skip Button.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  void checkFirstSeen(context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool seen = (prefs.getBool('seen') ?? false);

    if (seen) {
      Navigator.pushNamedAndRemoveUntil(context, '/started', (route) => false,);
    }
  }

  @override
  Widget build(BuildContext context) {

    // Check if we've seen the onboarding screen before.
    checkFirstSeen(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 30.h),
            const SkipButton(),
            const OnBoardingPages(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.w),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OnBoardingIndicator(),
                  NextButton(),
                ],
              ),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
