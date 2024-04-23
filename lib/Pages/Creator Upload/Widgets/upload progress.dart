import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Constants/Colors.dart';

import '../Data/variables.dart';

class UploadProgress extends StatelessWidget {
  const UploadProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 200.h,
        child: ValueListenableBuilder(
          valueListenable: uploadProgress,
          builder: (context, value, child) {
            if (value == -1) {
              return const Column(
                children: [
                  Spacer(flex: 4),
                  Text('Error uploading Video', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, color: Colors.red, fontWeight: FontWeight.w600)),
                  Spacer(flex: 5),
                  Text('try again later', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.redAccent)),
                  Spacer(flex: 2),
                ],
              );
            } else if (value == 2) {
              return const Column(
                children: [
                  Spacer(flex: 4),
                  Text('Video uploaded Successfully!', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, color: primaryColor, fontWeight: FontWeight.w600)),
                  Spacer(flex: 5),
                  Text('You may close the window', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: primaryColor)),
                  Spacer(flex: 2),
                ],
              );
            } else {
              return Column(
                children: [
                  const Spacer(flex: 4),
                  const Text('Uploading Video...', style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.w600)),
                  const Spacer(flex: 5),
                  Text('Progress: ${(value * 100).toStringAsFixed(2)}%', style: const TextStyle(fontSize: 20, color: primaryColor, fontWeight: FontWeight.w500),),
                  const Spacer(flex: 2),
                  LinearProgressIndicator(value: value, backgroundColor: Colors.grey[300], minHeight: 6),
                  const Spacer(flex: 2),
                ],
              );
            }
          },
        ),
      ),
      actions: <Widget>[
        ValueListenableBuilder(
          valueListenable: uploadProgress,
          builder: (context, value, child) => TextButton(
            onPressed: uploadProgress.value == -1 || uploadProgress.value == 2
                ? () => Navigator.of(context).pop()
                : null,
            child: const Text('close'),
          ),
        ),
      ],
    );
  }
}
