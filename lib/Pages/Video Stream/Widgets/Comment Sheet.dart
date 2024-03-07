import 'package:flutter/material.dart';

import '../../../Common/Models/Classes/Comment.dart';

class CommentSheet extends StatelessWidget {
  final List<Comment> comments;
  const CommentSheet({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(comment.profile.image),
          ),
          title: Text(comment.profile.name),
          subtitle: Text(comment.text),
        );
      },
    );
  }
}
