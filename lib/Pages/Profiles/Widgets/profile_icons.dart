// profile_icons.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Common/Firebase/Firestore/get child.dart';
import '../../../Common/Models/Classes/Child.dart';
import 'ID Dialog.dart';

class ProfileIcons extends StatelessWidget {
  final List<String> childIDs;

  ProfileIcons({required this.childIDs});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20.w,
      runSpacing: 20.h,
      children: childIDs.map((childID) {
        return FutureBuilder<Child?>(
          future: getChild(childID),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Show a loading spinner while waiting for the data
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}'); // Show an error message if an error occurred
            } else {
              final childData = snapshot.data;
              if (childData != null) {
                return InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    openDialog(
                      context,
                      childID,
                      childData.name,
                      childData.imageURL,
                      false,
                    );
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50.w,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 45.w,
                          backgroundImage: (childData.imageURL != null && childData.imageURL.isNotEmpty)
                              ? NetworkImage(childData.imageURL) as ImageProvider<Object>
                              : AssetImage('assets/images/profile_placeholder.png') as ImageProvider<Object>,
                        ),
                      ),
                      Text(childData.name, style: const TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  ),
                );
              } else {
                return Text('No child found with id: $childID'); // Show a message if no child data was found
              }
            }
          },
        );
      }).toList(),
    );
  }
}