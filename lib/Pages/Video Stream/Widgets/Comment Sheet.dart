import 'package:flutter/material.dart';
import 'package:the_eye/Common/Firebase/Firestore/get%20user.dart';
import 'package:the_eye/Common/Functions/History%20Generator.dart';
import 'package:the_eye/Constants/Colors.dart';

import '../../../Common/Models/Classes/Comment.dart';

class CommentSheet extends StatelessWidget {
  final List<Comment> comments;
  const CommentSheet({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    if (comments.isEmpty) {
      return const Center(
        child: Text('No comments yet!\n\nBe the first to comment.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
      );
    }
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: comments.length,
      separatorBuilder: (context, index) => const Divider(color: textColor, height: 4, thickness: 0.8, indent: 30, endIndent: 30),
      itemBuilder: (context, index) {
        final comment = comments[index];
        return FutureBuilder(
          future: getUser(comment.profileID),
          builder: (context, snapshot) {
            if (snapshot.hasData == false) {
              return const Center(child: CircularProgressIndicator());
            }
            final userData = snapshot.data!;
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(userData.imageURL),
              ),
              title: Text(userData.name),
              subtitle: Text(comment.text),
              trailing: Text(historyGenerator(comment.date)),
            );
          },
        );
      },
    );
  }
}
