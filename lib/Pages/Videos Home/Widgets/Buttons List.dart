import 'package:flutter/material.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Videos%20Home/Data/Variables.dart';

class ButtonsList extends StatelessWidget {
  const ButtonsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 30,
      child: ValueListenableBuilder(
        valueListenable: selectedIdx,
        builder: (context, value, child) => ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: buttons.length,
          separatorBuilder: (context, index) => const SizedBox(width: 13),
          itemBuilder: (context, idx) => AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,

            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              color: selectedIdx.value == idx ? selectedChipColor : unselectedChipColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: InkWell(
              onTap: () => selectedIdx.value = idx,
              child: Text(buttons[idx],
                style: TextStyle(
                  color: selectedIdx.value == idx ? Colors.white : Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.78,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
