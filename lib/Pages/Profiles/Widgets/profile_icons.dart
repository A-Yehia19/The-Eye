import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Pages/Profiles/data/variables.dart';

import 'ID Dialog.dart';


class ProfileIcons extends StatelessWidget {
  const ProfileIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Display 2 items per row
        ),
        itemCount: profileList.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      openDialog(
                        context,
                        profileList[index].name,
                        profileList[index].imageURL,
                        false,
                      );
                    },
                    child: CircleAvatar(
                      radius: 50.w, // Reduce the radius to make the icons smaller
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 45.w, // Reduce the radius to make the icons smaller
                        backgroundImage: AssetImage(profileList[index].imageURL),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.w),
                  Text(
                    profileList[index].name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.w,
                    ),
                  ),
                  SizedBox(height: 25.w),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}