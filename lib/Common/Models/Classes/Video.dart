import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_eye/Constants/links.dart';

import 'Comment.dart';

class Video{
  final String id;
  final String title;
  final String thumbnail;
  final String videoURL;
  final String description;
  int views;
  final String creatorID;
  final String status;
  int isLiked;
  bool isFavourite;
  late List<Comment> comments;
  late DateTime date;

  Video({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.videoURL,
    required this.creatorID,

    List<Comment>? comments,
    this.views = 0,
    this.isLiked = 0,
    this.isFavourite = false,
    this.status = "uploaded",
    DateTime? date,
  }){
    if (date != null) {
      this.date = date;
    } else {
      this.date = DateTime.now();
    }
    if (comments != null) {
      this.comments = comments;
    } else {
      this.comments = [];
    }
  }

  void like(){
    if (isLiked == 1) {
      isLiked = 0;
    } else {
      isLiked = 1;
    }
  }

  void dislike(){
    if (isLiked == -1) {
      isLiked = 0;
    } else {
      isLiked = -1;
    }
  }

  void addComment(Comment comment){
    comments.add(comment);
  }

  void view(){
    views++;
    FirebaseFirestore.instance.collection('videos').doc(id).update({
      'views': views,
    });
  }

  factory Video.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Video(
      id: doc.id,
      title: data['title'] ?? "title",
      description: data['description'] ?? "description",
      thumbnail: data['thumbnail'] ?? videoPlaceholderURL,
      videoURL: data['videoURL'] ?? "videoURL",
      creatorID: data['creatorID'] ?? "creatorID",
      views: data['views'] ?? 0,
      status: data['status'] ?? "uploaded",
      date: data['date'].toDate(),
      comments: (data['comments'] as List).map((comment) => Comment.fromMap(comment)).toList(),
    );
  }
}
