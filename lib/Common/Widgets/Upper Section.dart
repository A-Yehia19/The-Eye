import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/User.dart';
import 'package:the_eye/Constants/Colors.dart';

class UpperSection extends StatelessWidget {
  final User user;
  const UpperSection({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      alignment: Alignment.topCenter,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              height: 180.h,
              decoration: const BoxDecoration(
                color: primaryColor,
                image: DecorationImage(
                  image: AssetImage('assets/logo/eye_white.png'),
                  repeat: ImageRepeat.repeat,
                  opacity: 0.2,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: (-130.h/2) - 40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                user.imageURL.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.asset(
                          user.imageURL,
                          height: 130.h,
                          width: 130.h,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        height: 130.h,
                        width: 130.h,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 5,
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 80.h,
                        ),
                      ),
                SizedBox(height: 10.h),
                Text(
                  user.name,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


// to make the container rounded
class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 40;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}