import 'package:flutter/material.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Creator%20Upload/Data/Functions/pick%20image.dart';

import '../Data/variables.dart';

class ChooseThumbnail extends StatelessWidget {
  const ChooseThumbnail({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () async => thumbnailPath.value = await pickImage(),
        style: TextButton.styleFrom(
          backgroundColor: highlightColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 10,
          )
        ),
        child: const Text(
          'Choose cover',
          style: TextStyle(
              color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
