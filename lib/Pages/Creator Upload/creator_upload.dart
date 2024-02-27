import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Pages/Creator%20Upload/Widgets/choose_file.dart';
import 'package:the_eye/Pages/Creator%20Upload/Widgets/video_info_form.dart';

class CreatorUpload extends StatelessWidget {
  const CreatorUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove app bar shadow
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(
                'assets/images/daddy.jpg'), // Replace with your image
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none, color: Colors.grey),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.contact_support_rounded, color: Colors.grey),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 60,),
          ChooseFiles(),
          VideoForm()
        ],
      ),
    );
  }
}
