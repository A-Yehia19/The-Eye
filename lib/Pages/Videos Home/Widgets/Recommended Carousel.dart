import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Pages/Videos%20Home/Data/Variables.dart';
import 'package:the_eye/Pages/Videos%20Home/Widgets/Carousel%20Item.dart';

class RecommendedCarousel extends StatelessWidget {
  const RecommendedCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        height: 387.h,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        viewportFraction: 1,
        onPageChanged: (index, reason) => currentCard.value = index,
      ),
      items: carouselList.map((video) => CarouselItem(video: video)).toList()
    );
  }
}
