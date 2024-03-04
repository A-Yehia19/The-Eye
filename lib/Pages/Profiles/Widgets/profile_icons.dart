import 'package:flutter/material.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Profiles/Widgets/add_profile.dart';
import 'package:the_eye/Pages/Profiles/data/variables.dart';

import 'ID Dialog.dart';


class ProfileIcons extends StatelessWidget {
  const ProfileIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: profileList.length + 1, // Add 1 for the AddProfile widget
        itemBuilder: (context, index) {
          // Check if it's the last item
          if (index == profileList.length) {
            // Return the AddProfile widget as the last item
            return const AddProfile();
          } else {
            // Return the profile item
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    openDialog(
                      context,
                      profileList[index].name,
                      profileList[index].imageURL,
                    );
                  },
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: highlightColor,
                    child: CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage(profileList[index].imageURL),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  profileList[index].name,
                  style: const TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 25),
              ],
            );
          }
        },
      ),
    );
  }
}
