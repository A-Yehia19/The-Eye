import 'dart:io';

import 'package:flutter/material.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Creator%20Upload/Data/Functions/pick%20video.dart';

import '../Data/variables.dart';

class ChooseFiles extends StatelessWidget {
  const ChooseFiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          InkWell(
            onTap: () async => videoPath.value = await pickVideo(),
            child: ValueListenableBuilder(
              valueListenable: thumbnailPath,
              builder: (context, value, child) => Container(
                width: 300,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: highlightColor, width: 2),
                  image: value == null
                      ? null
                      : DecorationImage(
                    image: Image.file(File(value)).image,
                    fit: BoxFit.cover,
                  ),
                ),
                child: value == null
                ? const Icon(Icons.add, size: 100, color: highlightColor,)
                : const SizedBox(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: ValueListenableBuilder(
              valueListenable: videoPath,
              builder: (context, value, child) => value == null
                  ? const Text(
                    'Upload video',
                    style: TextStyle(
                        color: highlightColor, fontSize: 30),
                    )
                  : Text('Selected video: ${value.name}',
                    style: const TextStyle(
                        color: highlightColor, fontSize: 20),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
