import 'package:flutter/material.dart';
import 'package:the_eye/Common/Models/Classes/Creator.dart';
import 'package:the_eye/Pages/Creator%20Upload/Widgets/choose_file.dart';
import 'package:the_eye/Pages/Creator%20Upload/Widgets/video_info_form.dart';

import 'Widgets/choose_thumbnail.dart';

class CreatorUpload extends StatelessWidget {
  final Creator creator;
  const CreatorUpload({super.key, required this.creator});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove app bar shadow
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(creator.imageURL),
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
