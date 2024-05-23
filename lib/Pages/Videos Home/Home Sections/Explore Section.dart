import 'package:flutter/material.dart';
import 'package:the_eye/Common/Models/Classes/Child.dart';
import 'package:the_eye/Constants/Colors.dart';

import '../Widgets//Carousel Indicator.dart';
import '../Widgets//Recommended Carousel.dart';
import '../Widgets//Recommended Videos.dart';

class ExploreSection extends StatelessWidget {
  final Child child;
  const ExploreSection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RecommendedCarousel(user: child),
        const SizedBox(height: 10,),
        const CarouselIndicator(),
        const SizedBox(height: 10,),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text('What\'s New',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 10,),
        RecommendedVideos(user: child),
        const SizedBox(height: 25,),
      ],
    );
  }
}
