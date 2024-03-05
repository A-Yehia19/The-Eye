import 'package:flutter/material.dart';
import 'package:the_eye/Constants/Colors.dart';

class AddProfile extends StatelessWidget {
  const AddProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {},
          child: const CircleAvatar(
            radius: 75,
            backgroundColor: hintColor,
            child: Icon(Icons.add, size: 120, color: Colors.white,),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Add child",
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
