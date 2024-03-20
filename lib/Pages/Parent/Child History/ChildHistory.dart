import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/Child.dart';
import 'package:the_eye/Common/Models/Classes/Parent.dart';
import 'package:the_eye/Common/Widgets/Upper%20Section.dart';

import 'Widgets/Videos History List.dart';

class ChildHistory extends StatelessWidget {
  final Parent parent;
  final Child child;
  const ChildHistory({super.key, required this.child, required this.parent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UpperSection(user: child),
              Padding(
                padding: EdgeInsets.only(left: 20.w, bottom: 15.h),
                child: Text('Watch History', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              ),
              // VideosHistoryList(history: child.history),
              VideosHistoryList(history: [
                {'video': '1', 'time': DateTime.now().subtract(const Duration(days: 1))},
                {'video': '2', 'time': DateTime.now().subtract(const Duration(days: 2))},
                {'video': '3', 'time': DateTime.now().subtract(const Duration(days: 3))},
                {'video': '4', 'time': DateTime.now().subtract(const Duration(days: 4))},
                {'video': '5', 'time': DateTime.now().subtract(const Duration(days: 5))},
              ], parent: parent,),
              SizedBox(height: 20.h),
            ],
          ),
        )
    );
  }
}
