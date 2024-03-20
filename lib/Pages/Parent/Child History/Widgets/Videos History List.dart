import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';

import 'Video History Component.dart';

class VideosHistoryList extends StatelessWidget {
  final Parent parent;
  final List<Map<String, dynamic>> history;
  const VideosHistoryList({super.key, required this.history, required this.parent});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      itemCount: history.length,
      separatorBuilder: (context, index) => Divider(height: 30.h, thickness: 2, indent: 10.w, endIndent: 10.w),
      itemBuilder: (context, index) => VideoHistoryComponent(parent: parent, history: history[index]),
    );
  }
}
