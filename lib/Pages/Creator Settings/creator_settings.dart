import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_eye/Pages/Creator%20Home/Widgets/creator_options.dart';

import '../../Common/Models/Classes/Creator.dart';
import '../../Common/Widgets/Upper Section.dart';
import '../Parent/Common/WIdgets/Settings Button.dart';
import '../Parent/Parent Home/Functions/account_settings_functions.dart';
import 'Widgets/creator_settings_options.dart';

class CreatorSettings extends StatelessWidget {
  final Creator creator;
  const CreatorSettings({super.key, required this.creator});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              UpperSection(user: creator),
              SizedBox(height: 30.h),
              CreatorSettingsOptions(creator: creator),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SettingsButton(text: 'Delete Account', icon: Icons.delete_forever, isDanger: true, onPressed: () => showDeleteAccountDialog(context)),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        )
    );
  }
}
