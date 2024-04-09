import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Common/Models/Classes/Video.dart';
import '../../../Constants/Colors.dart';
import '../Data/Functions/Creator Fetch.dart';

class CreatorBar extends StatelessWidget {
  final Video video;
  const CreatorBar({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Creator(profile: video.creator))),
      child: FutureBuilder(
        future: getCreator(video.creatorID),
        builder: (context, snapshot) => !snapshot.hasData
            ? const Center(child: CircularProgressIndicator())
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      height: 40.r,
                      width: 40.r,
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: primaryColor,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          width: 2,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(snapshot.data!['photo']),
                          fit: BoxFit.cover,
                        ),
                      )
                  ),
                  SizedBox(width: 15.w),
                  Text(snapshot.data!['name'],
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
