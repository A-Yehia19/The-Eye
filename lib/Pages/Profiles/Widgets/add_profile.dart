import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Constants/Colors.dart';

class AddProfile extends StatelessWidget {
  const AddProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: CircleAvatar(
            radius: 74,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 70,
              child: Icon(Icons.add, size: 120, color: CupertinoColors.white,),
              backgroundColor: secondaryColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Add child profile",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 28,
          ),
        ),
      ],
    );
  }
}
