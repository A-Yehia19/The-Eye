import 'package:flutter/material.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/OnBoarding/Data/Variables.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentPage,
      builder: (context, value, child) => TextButton(
        onPressed: value == 2 ? null : () => pageController.animateToPage(2, duration: const Duration(milliseconds: 500), curve: Curves.easeIn),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Skip ',
                style: TextStyle(
                  fontSize: 20,
                  color: value == 2 ? highlightColor.withOpacity(0.5) : highlightColor,
                  fontWeight: FontWeight.bold,
                )
            ),
            Image.asset('assets/icons/skip-arrows.png', color: value == 2 ? highlightColor.withOpacity(0.5) : highlightColor),
          ],
        ),
      ),
    );
  }
}
