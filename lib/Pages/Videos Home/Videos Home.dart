import 'package:flutter/material.dart';
import 'package:the_eye/Pages/Videos%20Home/Widgets/Upper%20Bar.dart';

import 'Widgets/Buttons List.dart';
import 'Widgets/Recommended Videos.dart';

class VideosHome extends StatelessWidget {
  const VideosHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bubbles.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UpperBar(),
                SizedBox(height: 20),
                Text('Recommended Videos:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                ButtonsList(),
                SizedBox(height: 10),
                RecommendedVideos(),
              ],
            ),
          ),
        )
      ),
    );
  }
}

