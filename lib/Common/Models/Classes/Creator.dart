import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_eye/Constants/links.dart';

import 'User.dart';

class Creator extends User{
  late List<String> transactions;
  late List<String> videos;
  final String email;

  Creator({
    required String id,
    required String gender,
    required String name,
    required this.email,
    String imageURL = '',
    List<String>? transactions,
    List<String>? videos
  }) : super(id: id, role: "creator", gender: gender, name: name, imageURL: imageURL){
    if (transactions != null) {
      this.transactions = transactions;
    } else {
      this.transactions = [];
    }
    if (videos != null) {
      this.videos = videos;
    } else {
      this.videos = [];
    }
  }

  factory Creator.fromMap(Map<String, dynamic> map) {
    return Creator(
      id: map['id'] ?? '',
      gender: map['gender'] ?? '',
      name: map['name'] ?? '',
      imageURL: map['imageURL'] ?? profilePlaceholderURL,
      transactions: List<String>.from(map['transactions'] ?? []),
      videos: List<String>.from(map['videos'] ?? []),
      email: map['email'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'gender': gender,
      'name': name,
      'imageURL': imageURL,
      'transactions': transactions,
      'videos': videos,
      'role': 'creator',
    };
  }

  factory Creator.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Creator(
      id: doc.id,
      name: data['name'] ?? 'name',
      email: data['email'] ?? '',
      gender: data['gender'] ?? 'gender',
      imageURL: data['imageURL'] ?? profilePlaceholderURL,
      transactions: List<String>.from(data['transactions']),
      videos: List<String>.from(data['videos']),
    );
  }
}
