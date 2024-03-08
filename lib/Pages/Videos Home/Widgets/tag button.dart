import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/Colors.dart';
import '../Data/Variables.dart';

class TagButton extends StatelessWidget {
  final String text;
  final int buttonIdx;
  final int selectedIndex;
  const TagButton({super.key, required this.text, required this.buttonIdx, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    double areaWidth = MediaQuery.of(context).size.width - 30.w;
    double buttonWidth = areaWidth * 0.28;

    return AnimatedContainer(
      height: 30,
      width: buttonWidth,
      duration: const Duration(milliseconds: 500),
      alignment: Alignment.center,
      curve: Curves.easeOut,

      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: selectedIndex == buttonIdx ? primaryColor : primaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(7),
      ),
      child: InkWell(
        onTap: () => selectedTab.value = buttonIdx,
        child: Text(text,
          style: TextStyle(
            color: selectedIndex == buttonIdx ? Colors.white : Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.78,
          ),
        ),
      ),
    );
  }
}
