import 'package:flutter/material.dart';
import 'package:the_eye/Pages/Creator%20Home/Widgets/creator_options.dart';
import 'package:the_eye/Pages/Creator%20Home/Widgets/uploads_list.dart';
import 'package:the_eye/Common/Models/Classes/Creator.dart';
import 'package:the_eye/Pages/Creator%20Settings/creator_settings.dart';

import '../../Common/Widgets/Upper Section.dart';
import '../Parent/Common/WIdgets/Settings Button.dart';

class CreatorHome extends StatelessWidget {
  final Creator creator;
  const CreatorHome({super.key, required this.creator});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              UpperSection(user: creator,),
              CreatorOptions(creator: creator),
              Positioned(
                top: 40, // Adjust the value as needed
                right: 20, // Adjust the value as needed
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.notifications_none_rounded, color: Colors.white),
                      onPressed: () {
                        // Add your onPressed code here
                      },
                    ),
                    IconButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreatorSettings(creator: creator)),
                      );
                    }, icon: Icon(Icons.settings, color: Colors.white))
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 30.0, bottom: 10), // Adjust the value as needed
            child: const Text("Your Uploads", style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w500),),
          ),
          UploadsList(videosList: creator.videos),
        ],
      ),
      //bottomNavigationBar: SemiCircle(),
    );
  }
}