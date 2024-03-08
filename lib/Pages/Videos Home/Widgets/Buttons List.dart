import 'package:flutter/material.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Videos%20Home/Data/Variables.dart';
import 'package:the_eye/Pages/Videos%20Home/Widgets/tag%20button.dart';

class ButtonsList extends StatelessWidget {
  const ButtonsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ValueListenableBuilder(
        valueListenable: selectedTab,
        builder: (context, value, child) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TagButton(
              text: 'Explore',
              buttonIdx: -1,
              selectedIndex: selectedTab.value,
            ),
            const VerticalDivider(
              color: primaryColor,
              thickness: 2,
            ),
            ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: buttons.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(width: 13),
              itemBuilder: (context, idx) => TagButton(
                text: buttons[idx],
                buttonIdx: idx,
                selectedIndex: selectedTab.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
