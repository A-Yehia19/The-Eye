import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/Child.dart';
import 'package:the_eye/Common/Models/Classes/User.dart';
import 'package:the_eye/Common/Widgets/Upper%20Bar.dart';

import 'Data/Functions/Carousel Fetch.dart';
import 'Data/Variables.dart';
import 'Home Sections/Explore Section.dart';
import 'Home Sections/Favourites Section.dart';
import 'Home Sections/Liked Section.dart';
import 'Widgets/Buttons List.dart';

class VideosHome extends StatelessWidget {
  final User user;
  const VideosHome({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final child = user as Child;
    getCarouselList(child.prefs);

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
                  child: ValueListenableBuilder(
                    valueListenable: selectedTab,
                    builder: (context, value, childWidget) {
                      if (value == -1) {
                        return ExploreSection(child: child);
                      } else if (value == 0) {
                        return FavouritesSection(child: child);
                      } else if (value == 1) {
                        return LikedSection(child: child);
                      } else {
                        return const Center(
                          child: Icon(Icons.error, color: Colors.red, size: 100,),
                        );
                      }
                    },
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
