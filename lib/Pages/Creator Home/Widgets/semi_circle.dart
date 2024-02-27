import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Pages/Creator%20Upload/creator_upload.dart';

import '../../../Common/Widgets/button_widget.dart';
import '../../../Constants/Colors.dart';

class SemiCircle extends StatelessWidget {
  const SemiCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomNavBarClipper(),
      child: Container(
        height: 150, // Increase height
        color: blueEnd,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.only( bottom: 30),
                child: CustomButton(
                  buttonDecoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CreatorUpload()),
                    );
                  },
                  child: const Text(
                    "+ New Video",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15
                      //fontWeight: FontWeight.bold,
                      //fontFamily: 'Jua',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 90) // Move to top left
      ..quadraticBezierTo(size.width / 2, 0, size.width, 90) // Curve to top right
      ..lineTo(size.width, size.height) // Line to bottom right
      ..lineTo(0, size.height); // Line to bottom left
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}