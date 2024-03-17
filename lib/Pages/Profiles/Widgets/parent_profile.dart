// parent_profile.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Add Child/add_child.dart';
import 'ID Dialog.dart';

class ParentProfileBubble extends StatelessWidget {
  const ParentProfileBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            // The avatar
            InkWell(
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                openDialog(
                  context,
                  "Daddy",
                  "assets/images/daddy.jpg",
                  true,
                );
              },
              child: CircleAvatar(
                radius: 70.w,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 65.w,
                  backgroundImage: const AssetImage("assets/images/daddy.jpg"),
                ),
              ),
            ),
            // The add icon
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 40.w,
                width: 40.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.add, color: Theme.of(context).primaryColor),
                  onPressed: () {
                    // Navigate to AddChildPage when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddChild()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        // The parent's name
        Text(
          "Daddy",
          style: TextStyle(
              fontSize: 22.w,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
      ],
    );
  }
}