import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Video%20Stream/Widgets/Comment%20Sheet.dart';

import '../../../Common/Functions/History Generator.dart';
import '../../../Common/Models/Classes/Video.dart';

class VideoInformation extends StatefulWidget {
  final Video video;
  const VideoInformation({super.key, required this.video});

  @override
  State<VideoInformation> createState() => _VideoInformationState();
}

class _VideoInformationState extends State<VideoInformation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.video.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              const Icon(Icons.remove_red_eye_outlined, size: 20, color: Colors.black,),
              const SizedBox(width: 10),
              Text(
                widget.video.views.toString(),
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 20),
              const Icon(Icons.history_rounded, size: 20, color: Colors.black,),
              const SizedBox(width: 10),
              Text(
                historyGenerator(widget.video.date),
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () => setState(() => widget.video.like()),
                    icon: Icon(widget.video.isLiked == 1 ? Icons.thumb_up_rounded : Icons.thumb_up_outlined, size: 25.r),
                ),
                IconButton(
                    onPressed: () => setState(() => widget.video.dislike()),
                    icon: Icon(widget.video.isLiked == -1 ? Icons.thumb_down_rounded : Icons.thumb_down_outlined, size: 25.r),
                ),
                IconButton(
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      elevation: 10,
                      builder: (context) => CommentSheet(comments: widget.video.comments),
                    ),
                    icon: Icon(Icons.comment_outlined, size: 25.r),
                ),
                IconButton(
                    onPressed: () => setState(() => widget.video.favourite()),
                    icon: Icon(widget.video.isFavourite ? Icons.bookmark : Icons.bookmark_add_outlined, size: 25.r),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
