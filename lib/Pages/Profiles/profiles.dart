import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Pages/Profiles/Widgets/profile_icons.dart';

import '../../Constants/Colors.dart';

class Profiles extends StatelessWidget {
  const Profiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background1.jpg"),
                    fit: BoxFit.fill
                )
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Image.asset("assets/images/Profiles.png"),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 200),
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 50),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        gradient:
                        LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [blueStart, blueEnd]),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)
                        )
                    ),
                    child: const ProfileIcons()
                  )
              ),
            ],
          )
        ],
      ),
    );
  }
}
