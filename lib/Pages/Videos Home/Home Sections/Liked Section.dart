import 'package:flutter/material.dart';
import 'package:the_eye/Common/Models/Classes/Child.dart';
import 'package:the_eye/Constants/Colors.dart';

import '../Widgets/Saved Video Card.dart';

class LikedSection extends StatelessWidget {
  final Child child;
  const LikedSection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Liked Videos",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: primaryColor)
        ),
        const SizedBox(height: 10),
        child.likes.isEmpty
            ? const Text("\n\n\n\nYou haven't Liked any video yet.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey)
        )
            : Column(
          children: child.likes.map((videoID) => SavedVideoCard(videoID: videoID, user: child)).toList(),
        ),
      ],
    );
  }
}
