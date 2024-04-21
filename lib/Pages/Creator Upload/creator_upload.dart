import 'package:flutter/material.dart';
import 'package:the_eye/Pages/Creator%20Upload/Widgets/choose_file.dart';
import 'package:the_eye/Pages/Creator%20Upload/Widgets/video_info_form.dart';

import 'Widgets/choose_thumbnail.dart';

class CreatorUpload extends StatelessWidget {
  const CreatorUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove app bar shadow
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(
                'assets/images/daddy.jpg'), // Replace with your image
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.grey),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.contact_support_rounded, color: Colors.grey),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60,),
            ChooseFiles(),
            ChooseThumbnail(),
            SizedBox(height: 20,),
            VideoForm()
          ],
        ),
      ),
    );
  }
}
