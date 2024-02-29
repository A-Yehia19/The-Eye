import 'package:flutter/material.dart';
import 'package:the_eye/Constants/Colors.dart';
import 'package:the_eye/Pages/Creator%20Home/Widgets/uploads_list.dart';

import 'Widgets/semi_circle.dart';

class CreatorHome extends StatelessWidget {
  const CreatorHome({Key? key}) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 30, bottom: 10),
            child: Align(
              alignment: Alignment.topLeft,
                child: Text(
              "Your uploads",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 26,
                  fontWeight: FontWeight.w500),
            )),
          ),
          UploadsList()
        ],
      ),
      bottomNavigationBar: SemiCircle(),
    );
  }
}
