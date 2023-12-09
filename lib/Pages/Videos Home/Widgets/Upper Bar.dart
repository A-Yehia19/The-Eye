import 'package:flutter/material.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Constants/links.dart';

class UpperBar extends StatelessWidget {
  const UpperBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: ShapeDecoration(
            color: greyColor,
            image: const DecorationImage(
              image: NetworkImage(profileImagePlaceholder),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1000),
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Text('Hi Ali', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Spacer(),
        Image.asset('assets/images/logo.png', width: 50, height: 50),
      ],
    );
  }
}
