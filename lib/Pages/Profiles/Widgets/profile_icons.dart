import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Profiles/Widgets/add_profile.dart';
import 'package:the_eye/Pages/Profiles/data/variables.dart';
import 'package:the_eye/Pages/Videos%20Home/Data/Variables.dart';


class ProfileIcons extends StatelessWidget {
  const ProfileIcons({Key? key}) : super(key: key);

  void openDialog(context, name, imageURL) {
    showDialog(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            // Blurred background
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            // AlertDialog
            AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 74,
                    backgroundColor: primaryColor,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(imageURL),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: const TextField(
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),
                      decoration: InputDecoration(
                          hintText: "Enter your ID",
                          hintStyle: TextStyle(
                              color: Colors.white70,
                          ),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: TextButton(
                          onPressed: () {
                            username = name;
                            userImage = imageURL;
                            Navigator.pushNamed(context, '/videoHome');
                          },
                          child: const Text(
                            "Confirm",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Jua',
                            ),
                          )
                      )
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: profileList.length + 1, // Add 1 for the AddProfile widget
        itemBuilder: (context, index) {
          // Check if it's the last item
          if (index == profileList.length) {
            // Return the AddProfile widget as the last item
            return AddProfile();
          } else {
            // Return the profile item
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    openDialog(
                      context,
                      profileList[index].name,
                      profileList[index].imageURL,
                    );
                  },
                  child: CircleAvatar(
                    radius: 79,
                    backgroundColor: Colors.white,
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
                    color: Colors.white,
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
