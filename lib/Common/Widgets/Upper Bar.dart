import 'package:flutter/material.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Videos%20Home/Data/Variables.dart';

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
            image: DecorationImage(
              image: AssetImage(userImage),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1000),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(username, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Spacer(),
        Image.asset('assets/logo/eye.png', height: 70),
      ],
    );
  }
}
