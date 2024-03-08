import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_eye/Pages/OnBoarding/Data/Variables.dart';

import '../../../Constants/Colors.dart';

class OnBoardingIndicator extends StatelessWidget {
  const OnBoardingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: currentPage,
        builder: (context, value, child) => AnimatedSmoothIndicator(
          activeIndex: value,
          count: onboardingImages.length,
          onDotClicked: (index) => pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
          ),

          effect: ExpandingDotsEffect(
            dotHeight: 8.r,
            dotWidth: 8.r,
            spacing: 10.r,
            activeDotColor: highlightColor,
            dotColor: secondaryColor,
          ),
        ),
    );
  }
}
