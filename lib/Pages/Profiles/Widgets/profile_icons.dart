import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Firebase/Firestore/get%20user.dart';
import 'package:the_eye/Constants/links.dart';
import '../../../Common/Models/Classes/Child.dart';
import 'ID Dialog.dart';

class ProfileIcons extends StatelessWidget {
  final List<String> childIDs;

  const ProfileIcons({super.key, required this.childIDs});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20.w,
      runSpacing: 20.h,
      children: childIDs.map((childID) {
        return FutureBuilder(
          future: getUser(childID),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Show a loading spinner while waiting for the data
            } else if (snapshot.hasData) {
              final childData = snapshot.data as Child;
              return InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  openDialog(
                    context,
                    childData
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50.w,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 45.w,
                        backgroundImage: (childData.imageURL.isNotEmpty)
                            ? NetworkImage(childData.imageURL) as ImageProvider<Object>
                            : const AssetImage(profilePlaceholderAsset),
                      ),
                    ),
                    Text(childData.name, style: const TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                ),
              );
            } else {
              return Text('Error: ${snapshot.error}'); // Show an error message if an error occurred
            }
          },
        );
      }).toList(),
    );
  }
}