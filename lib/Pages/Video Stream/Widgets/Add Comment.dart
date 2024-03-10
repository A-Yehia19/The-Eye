import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Models/Classes/Comment.dart';
import 'package:the_eye/Constants/Colors.dart';

import '../../../Common/Models/Classes/User.dart';
import '../../../Common/Models/Classes/Video.dart';

class AddComment extends StatefulWidget {
  final Video video;
  const AddComment({super.key, required this.video});

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  bool _isFocused = false;
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: _isFocused ? null : () {
          if (!_isFocused) {
            FocusScope.of(context).unfocus();
            setState(() => _isFocused = true);
          }
        },
        splashFactory: NoSplash.splashFactory,
        child: AnimatedContainer(
          height: _isFocused ? 60 : 40.h,
          width: _isFocused ? 335.w : 220.w,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_isFocused ? 8.r : 100),
            color: primaryColor,
          ),
          child: !_isFocused
              ? const Text('Add Comment', style: TextStyle(color: secondaryColor, fontWeight: FontWeight.w600))
              : TextField(
                  controller: _commentController,
                  onTapOutside: (event) {
                    if(_commentController.text.isEmpty) {
                      setState(() => _isFocused = false);
                    }
                  },
                  decoration: InputDecoration(
                    filled: false,
                    hintText: 'Add comment',
                    hintStyle: const TextStyle(color: secondaryColor),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    prefix: const SizedBox(width: 10),
                    suffixIcon: InkWell(
                      onTap: () => submitComment(_commentController),
                      splashFactory: NoSplash.splashFactory,
                      child: const Icon(Icons.send, color: secondaryColor)
                    ),
                  ),
                  style: const TextStyle(color: textColor),
                  maxLines: 1,
                  cursorColor: secondaryColor,
                ),
        ),
      ),
    );
  }

  submitComment(TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      final comment = Comment(
          text: controller.text,
          profile: User(
            name: 'User',
            role: 'child',
            image: 'https://i.pravatar.cc/150?img=3',
          ),
      );
      widget.video.comments.add(comment);
      controller.clear();
      setState(() => _isFocused = false);
      print('comment added successfully');
    }
  }
}
