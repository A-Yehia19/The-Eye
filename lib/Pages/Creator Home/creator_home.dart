import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Firebase/Auth/signout.dart';
import 'package:the_eye/Pages/Creator%20Home/Widgets/creator_options.dart';
import 'package:the_eye/Pages/Creator%20Home/Widgets/uploads_list.dart';
import 'package:the_eye/Common/Models/Classes/Creator.dart';

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
                child: IconButton(
                  icon: const Icon(Icons.notifications_none_rounded, color: Colors.white),
                  onPressed: () {
                    // Add your onPressed code here
                  },
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
          Padding(
            padding: EdgeInsets.all(10.h),
            child: SettingsButton(text: 'Sign out', icon: Icons.logout_rounded, onPressed: () => signOut(context)),
          ),
        ],
      ),
      //bottomNavigationBar: SemiCircle(),
    );
  }
}