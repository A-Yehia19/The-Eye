// parent_profile.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Add Child/add_child.dart';
import 'ID Dialog.dart';

class ParentProfileBubble extends StatelessWidget {
  final Map<String, dynamic> parentData;

  ParentProfileBubble({required this.parentData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            InkWell(
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                openDialog(
                  context,
                  0,
                  parentData['name'],
                  parentData['image'],
                  true,
                );
              },
              child: CircleAvatar(
                radius: 70.w,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 65.w,
                  backgroundImage: AssetImage(parentData['imageURL']),
                ),
              ),
            ),
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
        Text(
          parentData['name'],
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