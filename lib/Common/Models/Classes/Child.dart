import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_eye/Constants/links.dart';

import 'User.dart';

class Child extends User {
  final String parentID;
  final String PIN;
  final String birthDate; //changed from datetime to string for now
  late List<Map<String, dynamic>> history;
  late List<String> likes;
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
      this.screenTime = screenTime;
    } else {
      this.screenTime = {'sun': 0, 'mon': 0, 'tue': 0, 'wed': 0, 'thu': 0, 'fri': 0, 'sat': 0};
    }
    if (history != null) {
      this.history = history;
    } else {
      this.history = [];
    }
  }

  // map firestore object to child object
  factory Child.fromMap(Map<String, dynamic> map) {
    return Child(
      id: map['id'] ?? '',
      parentID: map['parentID'] ?? '',
      gender: map['gender'] ?? '',
      name: map['name'] ?? '',
      imageURL: map['imageURL'] ?? profilePlaceholderURL,
      PIN: map['PIN'] ?? '',
      history: List<Map<String, dynamic>>.from(map['history']?.map((item) => Map<String, dynamic>.from(item)) ?? []),
      likes: List<String>.from(map['likes'] ?? []),
      favourites: List<String>.from(map['favourites'] ?? []),
      prefs: List<String>.from(map['prefs'] ?? []),
      screenTime: Map<String, double>.from(map['screenTime'] ?? {}),
      birthDate: map['birthDate'] ?? '',
    );
  }

  // map child object to firestore object
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'gender': gender,
      'imageURL': imageURL,
      'parentID': parentID,
      'PIN': PIN,
      'birthDate': birthDate,
      'history': history,
      'likes': likes,
      'favourites': favourites,
      'prefs': prefs,
      'screenTime': screenTime,
      "role": "child",
    };
  }

  factory Child.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Child(
      id: doc.id,
      name: data['name'] ?? 'name',
      gender: data['gender'] ?? 'gender',
      imageURL: data['imageURL'] ?? profilePlaceholderURL,
      parentID: data['parentID'],
      PIN: data['PIN'] ?? '',
      history: data['history'] ?? [],
      likes: data['likes'] ?? [],
      favourites: data['favourites'] ?? [],
      prefs: data['prefs'] ?? [],
      screenTime: data['screenTime'] ?? {},
      birthDate: data['birthDate'] ?? '',
    );
  }
}
