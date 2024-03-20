import 'package:flutter/material.dart';
import 'package:the_eye/Pages/Support/contact_support.dart';

import '../../../Constants/Colors.dart';
import '../../Creator Upload/creator_upload.dart';

class CreatorOptions extends StatelessWidget {
  const CreatorOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                backgroundColor: highlightColor,
                child: Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreatorUpload()),
                  );
                },
                tooltip: 'Add new video',
              ),
              SizedBox(width: 185),
              FloatingActionButton(
                backgroundColor: customPink,
                child: Icon(Icons.support_agent, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactSupport()),
                  );
                },
                tooltip: 'Contact support',
              ),
            ],
          ),
        ],
      ),
    );
  }
}