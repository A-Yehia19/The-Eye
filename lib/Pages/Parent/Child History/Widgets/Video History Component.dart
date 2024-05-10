import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Firebase/Firestore/get%20video.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Parent/Report%20Video/ReportVideo.dart';
import 'package:the_eye/Pages/Video%20Stream/Video%20Stream.dart';

class VideoHistoryComponent extends StatelessWidget {
  final Parent parent;
  final Map<String, dynamic> history;
  const VideoHistoryComponent({super.key, required this.history, required this.parent});

  @override
  Widget build(BuildContext context) {
    final DateTime time = history['date'].toDate();

    return FutureBuilder(
      future: getVideo(history['video']),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final video = snapshot.data!;
        return Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => VideoStream(video: video, user: parent,))),
                  child: Container(
                      width: 140.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        image: DecorationImage(
                          image: NetworkImage(video.thumbnail),
                          fit: BoxFit.cover,
                        ),
                      )
                  ),
                ),
                SizedBox(height: 7.h),
                SizedBox(
                  width: 140.w,
                  child: Text(
                    video.title,
                    style: const TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${time.hour}:${time.minute}\n'
                          '${time.day}/${time.month}/${time.year}',
                      style: TextStyle(color: textColor, fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 30.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () => reportVideo(context, parent, video.id),
                        child: Container(
                          width: 105.w,
                          height: 30.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: const Text('Report', style: TextStyle(color: secondaryColor, fontSize: 16, fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }
    );
  }

  reportVideo (context, parent, videoID) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ReportVideo(parent: parent, videoID: videoID)));
  }
}
