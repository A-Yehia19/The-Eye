import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Profiles/data/variables.dart';
import 'package:the_eye/Pages/Videos%20Home/Videos%20Home.dart';

import '../../../Common/Models/Profile Class.dart';

class ProfileIcons extends StatelessWidget {
  const ProfileIcons({Key? key}) : super(key: key);

  void openDialog(BuildContext context, String name, String imageURL) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                  SizedBox(height: 10),
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Enter your ID",
                          hintStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w300),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => VideosHome()),
                            );
                          },
                          child: Text(
                            "Confirm",
                            style: TextStyle(color: Colors.white),
                          )))
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
    return ListView.builder(
      itemCount: profileList.length,
      itemBuilder: (context, index) => Column(
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
          SizedBox(height: 10),
          Text(
            profileList[index].name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
