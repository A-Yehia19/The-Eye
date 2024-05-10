import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/Child.dart';
import 'package:the_eye/Common/Models/Classes/User.dart';
import 'package:the_eye/Common/Widgets/Upper%20Bar.dart';
import 'package:the_eye/Constants/Colors.dart';

import 'Data/Functions/Carousel Fetch.dart';
import 'Widgets/Buttons List.dart';
import 'Widgets/Carousel Indicator.dart';
import 'Widgets/Recommended Carousel.dart';
import 'Widgets/Recommended Videos.dart';

class VideosHome extends StatelessWidget {
  final User user;
  const VideosHome({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    getCarouselList();
    print('*******************************************');
    Child child = user as Child;
    print(child.toMap().toString());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UpperBar(),
              const SizedBox(height: 20),
              const ButtonsList(),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      RecommendedCarousel(user: user),
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
                      RecommendedVideos(user: user),
                      const SizedBox(height: 25,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
