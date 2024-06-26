// add_child.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Common/Widgets/button_widget.dart';
import 'package:the_eye/Pages/Add%20Child/Widgets/choose_content.dart';
import 'package:the_eye/Pages/Add%20Child/Functions/submit_child.dart';
import 'package:the_eye/Pages/Add%20Child/Widgets/add_child_form.dart';
import 'package:the_eye/Common/Widgets/Back.dart';

import '../../Common/Widgets/set_user_profile_pic.dart';

class AddChild extends StatefulWidget {
  const AddChild({Key? key}) : super(key: key);

  @override
  _AddChildState createState() => _AddChildState();
}

// add_child.dart
class _AddChildState extends State<AddChild> {
  final GlobalKey<AddChildFormState> formKey = GlobalKey();
  final GlobalKey<ChooseChildContentState> contentKey = GlobalKey();
  final GlobalKey<UserProfilePicState> picKey = GlobalKey(); // Add this line

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ...
      body: SafeArea(
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: ListView(
                  children: [
                    SizedBox(height: 60.h,),
                    AddChildForm(key: formKey, picKey: picKey,),
                    ChooseChildContent(key: contentKey),
                    SizedBox(height: 70.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
                      child: CustomButton(
                        onPressed: () {
                          print('picKey.currentState?.imageFile: ${picKey.currentState?.imageFile}');
                          submit(picKey.currentState?.imageFile, formKey, contentKey, context);
                        },
                        child: const Text(
                          "Create child account",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10, // Adjust the value as needed
              left: 10, // Adjust the value as needed
              child: Padding(padding: EdgeInsets.all(10.w),
              child: const Back()),
            ),
          ],
        ),
      ),
    );
  }
}