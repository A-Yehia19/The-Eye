import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/User.dart';
import 'package:the_eye/Pages/Videos%20Home/Data/Variables.dart';
import 'package:the_eye/Pages/Videos%20Home/Widgets/Carousel%20Item.dart';

class RecommendedCarousel extends StatelessWidget {
  final User user;
  const RecommendedCarousel({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: carouselLoaded,
      builder: (context, value, child) => value == false
          ? const SizedBox(
              height: 400,
              child: Center(child: CircularProgressIndicator()),
          )
          : CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                height: 400.h,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) => currentCard.value = index,
              ),
              items: carouselList.map((video) => CarouselItem(video: video, user: user,)).toList()
            ),
    );
  }
}
