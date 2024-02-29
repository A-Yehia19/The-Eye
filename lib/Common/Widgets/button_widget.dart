import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final Decoration? buttonDecoration;
  final Widget child;

  const CustomButton({
    Key? key,
    this.onPressed,
    this.buttonColor,
    this.buttonDecoration,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: buttonDecoration ?? BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}