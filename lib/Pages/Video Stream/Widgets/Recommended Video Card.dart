import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Common/Models/Classes/Video.dart';
import '../../../Constants/Colors.dart';
import '../../Video Stream/Video Stream.dart';

class VideoCard extends StatelessWidget {
  final Video video;
  const VideoCard({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => VideoStream(video: video))),
      splashFactory: NoSplash.splashFactory,
      child: Container(
        width: 204.w,
        height: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 126.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(video.thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
              child: Text(video.caption,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: secondaryColor,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.78,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                SizedBox(width: 15.w),
                Icon(Icons.remove_red_eye_outlined, color: secondaryColor, size: 20.sp),
                SizedBox(width: 10.w),
                Text('1.2k',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Icon(Icons.history_rounded, color: secondaryColor, size: 20.sp),
                SizedBox(width: 10.w),
                Text('5 Days Ago',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 15.w),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
