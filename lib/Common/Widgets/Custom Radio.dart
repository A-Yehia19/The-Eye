import 'package:flutter/material.dart';

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final double width;
  final double height;
  final Color activeColor;
  final Color inactiveColor;

  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.width = 20,
    this.height = 20,
    this.activeColor = const Color(0xFFFFC107),
    this.inactiveColor = const Color(0xFFD9D9D9),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 4.0, top: 4.0),
      child: InkWell(
        onTap: () {
          onChanged(this.value);
        },
        child: Container(
          height: this.height,
          width: this.width,
          decoration: ShapeDecoration(
            shape: CircleBorder(side: BorderSide(color: inactiveColor, width: 3)),
          ),
          child: Center(
            child: AnimatedContainer(
              height: this.height,
              width: this.width,
              decoration: ShapeDecoration(
                shape: const CircleBorder(),
                color: value == groupValue ? activeColor : inactiveColor,
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            ),
          ),
        ),
      ),
    );
  }
}
