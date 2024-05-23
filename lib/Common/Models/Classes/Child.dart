import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_eye/Constants/links.dart';

import 'User.dart';
import 'Video.dart';

class Child extends User {
  final String parentID;
  final int PIN;
  final DateTime birthDate; //changed from datetime to string for now
  late List<Map<String, dynamic>> history;
  late List<String> likes;
  late List<String> dislikes;
  late List<String> favourites;
  late List<String> prefs;
  late Map<String, double> screenTime;

  Child({
    required String id,
    required String gender,
    required String name,
    String imageURL = '',
    required this.parentID,
    required this.PIN,
    required this.birthDate,

    List<String>? likes,
    List<String>? dislikes,
    List<String>? favourites,
    List<String>? prefs,
    Map<String, double>? screenTime,
    List<Map<String, dynamic>>? history,
  }) : super(id: id, role: "child", gender: gender, name: name, imageURL: imageURL) {
    if (likes != null) {
      this.likes = likes;
    } else {
      this.likes = [];
    }
    if (dislikes != null) {
      this.dislikes = dislikes;
    } else {
      this.dislikes = [];
    }
    if (favourites != null) {
      this.favourites = favourites;
    } else {
      this.favourites = [];
    }
    if (prefs != null) {
      this.prefs = prefs;
    } else {
      this.prefs = [];
    }
    if (screenTime != null) {
      this.screenTime = {
        'sun': screenTime['sun'] ?? 0,
        'mon': screenTime['mon'] ?? 0,
        'tue': screenTime['tue'] ?? 0,
        'wed': screenTime['wed'] ?? 0,
        'thu': screenTime['thu'] ?? 0,
        'fri': screenTime['fri'] ?? 0,
        'sat': screenTime['sat'] ?? 0,
      };
    } else {
      this.screenTime = {'sun': 0, 'mon': 0, 'tue': 0, 'wed': 0, 'thu': 0, 'fri': 0, 'sat': 0};
    }
    if (history != null) {
      this.history = history;
    } else {
      this.history = [];
    }
  }

  viewVideo(Video video) {
    video.view();
    history.add({
      'video': video.id,
      'date': DateTime.now(),
    });
  }

  likeVideo(Video video) {
    video.like();
    if (likes.contains(video.id)) {
      likes.remove(video.id);
    } else {
      likes.add(video.id);
      if (dislikes.contains(video.id)) {
        dislikes.remove(video.id);
      }
    }
  }

  dislikeVideo(Video video) {
    video.dislike();
    if (dislikes.contains(video.id)) {
      dislikes.remove(video.id);
    } else {
      dislikes.add(video.id);
      if (likes.contains(video.id)) {
        likes.remove(video.id);
      }
    }
  }

  favouriteVideo(Video video) {
    if (favourites.contains(video.id)) {
      favourites.remove(video.id);
      video.isFavourite = false;
    } else {
      favourites.add(video.id);
      video.isFavourite = true;
    }
  }

  addScreenTime(String day, double time) {
    screenTime[day] = screenTime[day]! + time;
  }

  // map child object to firestore object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'imageURL': imageURL,
      'parentID': parentID,
      'PIN': PIN,
      'birthDate': birthDate,
      'history': history,
      'likes': likes,
      'dislikes': dislikes,
      'favourites': favourites,
      'prefs': prefs,
      'screenTime': screenTime,
      "role": "child",
    };
  }

  factory Child.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    Map<String, double>? screenTime;
    if (data['screenTime'] != null) {
      screenTime = {
        'sun': data['screenTime']['sun'].toDouble() ?? 0,
        'mon': data['screenTime']['mon'].toDouble() ?? 0,
        'tue': data['screenTime']['tue'].toDouble() ?? 0,
        'wed': data['screenTime']['wed'].toDouble() ?? 0,
        'thu': data['screenTime']['thu'].toDouble() ?? 0,
        'fri': data['screenTime']['fri'].toDouble() ?? 0,
        'sat': data['screenTime']['sat'].toDouble() ?? 0,
      };
    }

    return Child(
      id: doc.id,
      name: data['name'] ?? 'name',
      gender: data['gender'] ?? 'gender',
      imageURL: data['imageURL'] ?? profilePlaceholderURL,
      parentID: data['parentID'],
      PIN: data['PIN'] ?? '',
      history: List<Map<String, dynamic>>.from(data['history'] ?? []),
      likes: List<String>.from(data['likes'] ?? []),
      dislikes: List<String>.from(data['dislikes'] ?? []),
      favourites: List<String>.from(data['favourites'] ?? []),
      prefs: List<String>.from(data['prefs'] ?? []),
      screenTime: screenTime,
      birthDate: data['birthDate'].toDate(),
    );
  }
}
