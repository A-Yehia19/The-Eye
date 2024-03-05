import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Widgets/Upper%20Bar.dart';
import 'package:the_eye/Constants/Colors.dart';

import 'Widgets/Buttons List.dart';
import 'Widgets/Carousel Indicator.dart';
import 'Widgets/Recommended Carousel.dart';
import 'Widgets/Recommended Videos.dart';

class VideosHome extends StatelessWidget {
  const VideosHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.w),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UpperBar(),
              SizedBox(height: 20),
              ButtonsList(),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      RecommendedCarousel(),
                      SizedBox(height: 10,),
                      CarouselIndicator(),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('What\'s New',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      RecommendedVideos(),
                      SizedBox(height: 25,),
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
