import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Functions/Current%20Day%20Formatted.dart';
import 'package:the_eye/Common/Models/Classes/Child.dart';
import 'package:the_eye/Common/Models/Classes/User.dart';
import 'package:the_eye/Constants/Colors.dart';

import '../../Common/Models/Classes/Video.dart';
import 'Functions/update on dispose.dart';
import 'Widgets/Add Comment.dart';
import 'Widgets/Creator Bar.dart';
import 'Widgets/Other Videos.dart';
import 'Widgets/Video Box.dart';
import 'Widgets/Video Information.dart';

class VideoStream extends StatefulWidget {
  final Video video;
  final User user;
  const VideoStream({super.key, required this.user, required this.video});

  @override
  State<VideoStream> createState() => _VideoStreamState();
}

class _VideoStreamState extends State<VideoStream> {
  late Stopwatch stopwatch = Stopwatch();

  @override
  void initState() {
    if (widget.user is Child) {
      final child = widget.user as Child;
      child.viewVideo(widget.video);
      stopwatch.reset();
      stopwatch.start();
    }
    super.initState();
  }

  @override
  void dispose() {
    stopwatch.stop();
    if (widget.user is Child) {
      final child = widget.user as Child;
      String day = currentDayFormatted();

      child.addScreenTime(day, stopwatch.elapsed.inSeconds.toDouble());
      print(child.screenTime);

      updateOnDispose(child);
    }
    stopwatch.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoBox(video: widget.video),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    VideoInformation(video: widget.video, user: widget.user),
                    const SizedBox(height: 15),
                    Divider(color: Colors.black, thickness: 0.8, indent: 20.w, endIndent: 20.w),
                    CreatorBar(video: widget.video),
                    Divider(color: Colors.black, thickness: 0.8, indent: 20.w, endIndent: 20.w),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(widget.video.description),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text('What\'s New Today',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: textColor,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    OtherVideos(user: widget.user, video: widget.video),
                  ],
                ),
              ),
            ),
            AddComment(video: widget.video, user: widget.user),
          ],
        ),
      ),
    );
  }
}
