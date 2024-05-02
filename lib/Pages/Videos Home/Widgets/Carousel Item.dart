import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Firebase/Firestore/get%20user.dart';
import 'package:the_eye/Common/Models/Classes/Video.dart';
import 'package:the_eye/Constants/Colors.dart';

import '../../Video Stream/Video Stream.dart';

class CarouselItem extends StatelessWidget {
  final Video video;
  const CarouselItem({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ColoredBox(
        color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 185.h,
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
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Text(video.title,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: secondaryColor,
                  fontWeight: FontWeight.w600,
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
                Icon(Icons.remove_red_eye_outlined, color: secondaryColor, size: 30.sp),
                SizedBox(width: 15.w),
                Text(video.views.toString(),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 35.w),
                Icon(Icons.history_rounded, color: secondaryColor, size: 30.sp),
                SizedBox(width: 15.w),
                Text('5 Days Ago',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Divider(color: secondaryColor, thickness: 1, height: 30.h, indent: 15.w, endIndent: 15.w),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FutureBuilder(
                  future: getUser(video.creatorID),
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) {
                      return const Center(child: CircularProgressIndicator(color: primaryColor));
                    }

                    // final creator = snapshot.data! as Creator;
                    final creator = snapshot.data!;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 15.w),
                        CircleAvatar(
                          radius: 24.r,
                          backgroundImage: NetworkImage(creator.imageURL),
                        ),
                        SizedBox(width: 30.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(creator.name,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: secondaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text('1.2k Subscribers', //todo: add subscribers count
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: secondaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                Container(
                  width: 70.w,
                  margin: EdgeInsets.only(top: 10.h),
                  alignment: Alignment.centerRight,
                  decoration: const BoxDecoration(
                    color: highlightColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
                  ),
                  child: IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => VideoStream(video: video))),
                    icon: Icon(Icons.arrow_forward_outlined, color: secondaryColor, size: 30.sp),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
