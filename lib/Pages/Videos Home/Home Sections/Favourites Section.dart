import 'package:flutter/material.dart';
import 'package:the_eye/Common/Models/Classes/Child.dart';
import 'package:the_eye/Constants/Colors.dart';

import '../Widgets/Saved Video Card.dart';

class FavouritesSection extends StatelessWidget {
  final Child child;
  const FavouritesSection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Favourites",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: primaryColor)
        ),
        const SizedBox(height: 10),
        child.favourites.isEmpty
          ? const Text("\n\n\n\nYou haven't added any videos to your favourites yet.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey)
            )
          : Column(
              children: child.favourites.map((videoID) => SavedVideoCard(videoID: videoID, user: child)).toList(),
            ),
      ],
    );
  }
}
