import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../Constants/Colors.dart';
import '../../Videos Home/Data/Variables.dart';

void openDialog(context, name, imageURL) {
  showDialog(
    context: context,
    builder: (context) {
      return Stack(
        children: [
          // Blurred background
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          // AlertDialog
          AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundColor: highlightColor,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(imageURL),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 30),
                const TextField(
                  style: TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(hintText: "Enter your ID", constraints: BoxConstraints(maxHeight: 50)),
                ),
                const SizedBox(height: 25),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextButton(
                        onPressed: () {
                          username = name;
                          userImage = imageURL;
                          Navigator.pushNamed(context, '/videoHome');
                        },
                        child: const Text(
                          "Confirm",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                    )
                )
              ],
            ),
          ),
        ],
      );
    },
  );
}