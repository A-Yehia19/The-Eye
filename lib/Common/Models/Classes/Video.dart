import 'package:cloud_firestore/cloud_firestore.dart';

import 'Comment.dart';

class Video{
  final String id;
  final String title;
  final String thumbnail;
  final String videoURL;
  final String description;
  final int views;
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

  void favourite(){
    isFavourite = !isFavourite;
  }

  void addComment(Comment comment){
    comments.add(comment);
  }

  factory Video.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Video(
      id: doc.id,
      title: data['title'],
      description: data['description'],
      thumbnail: data['thumbnail'],
      videoURL: data['videoURL'],
      creatorID: data['creatorID'],
      views: data['views'],
      status: data['status'],
      date: data['date'].toDate(),
      comments: (data['comments'] as List).map((comment) => Comment.fromMap(comment)).toList(),
    );
  }
}
