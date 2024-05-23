import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Videos%20Home/Data/Variables.dart';

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: carouselLoaded,
      builder: (context, value, child) => value == false
          ? const SizedBox()
          : ValueListenableBuilder(
            valueListenable: currentCard,
            builder: (context, value, child) => AnimatedSmoothIndicator(
              activeIndex: currentCard.value,
              count: carouselList.length,
              onDotClicked: (index) => carouselController.animateToPage(index),

              effect: WormEffect(
                dotHeight: 10.r,
                dotWidth: 10.r,
                spacing: 10.r,
                activeDotColor: highlightColor,
                dotColor: primaryColor,
              ),
            ),
          ),
    );
  }
}
