import 'package:the_eye/Common/Models/Classes/Creator.dart';

import 'Comment.dart';

class Video{
  final String id;
  final String caption;
  final String thumbnail;
  final String url;
  final int views;
  final Creator creator;
  int isLiked;
  bool isFavourite;
  late List<Comment> comments;
  late DateTime date;

  Video({
    required this.id,
    required this.caption,
    required this.thumbnail,
    required this.url,
    required this.creator,

    List<Comment>? comments,
    this.views = 0,
    DateTime? date,
    this.isLiked = 0,
    this.isFavourite = false
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
}