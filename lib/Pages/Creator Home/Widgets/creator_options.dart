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
          const SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                backgroundColor: highlightColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreatorUpload()),
                  );
                },
                tooltip: 'Add new video',
                child: const Icon(Icons.add, color: Colors.white),
              ),
              const SizedBox(width: 185),
              FloatingActionButton(
                backgroundColor: customPink,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactSupport()),
                  );
                },
                tooltip: 'Contact support',
                child: const Icon(Icons.support_agent, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}