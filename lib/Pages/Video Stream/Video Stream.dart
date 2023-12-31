import 'package:flutter/material.dart';
import 'package:the_eye/Common/Models/Vedio%20Class.dart';

class VideoStream extends StatelessWidget {
  final Video? video;
  const VideoStream({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Video Stream'),
      ),);
  }
}
