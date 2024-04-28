import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_eye/Constants/links.dart';

import 'User.dart';

class Parent extends User {
  final String plan;
  final String email;
  String PIN;
  late List<String> children;
  late List<String> transactions;

  Parent({
    required String id,
    required String gender,
    required String name,
    required this.email,
    String imageURL = '',
    this.plan = "free",
    this.PIN = '',

    List<String>? children,
    List<String>? transactions,
  }) : super(id: id, role: "parent", gender: gender, name: name, imageURL: imageURL) {
    if (children != null) {
      this.children = children;
    } else {
      this.children = [];
    }
    if (transactions != null) {
      this.transactions = transactions;
    } else {
      this.transactions = [];
    }
  }

  factory Parent.fromMap(Map<String, dynamic> map) {
    return Parent(
      id: map['id'] ?? '',
      gender: map['gender'] ?? 'gender',
      name: map['name'] ?? 'name',
      imageURL: map['imageURL'] ?? profilePlaceholderURL,
      email: map['email'] ?? '',
      plan: map['plan'] ?? 'free',
      PIN: map['PIN'] ?? '',
      children: map['children'] != null ? List<String>.from(map['children']) : [],
      transactions: map['transactions'] != null ? List<String>.from(map['transactions']) : [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'gender': gender,
      'name': name,
      'imageURL': imageURL,
      'plan': plan,
      'PIN': PIN,
      'children': children,
      'transactions': transactions,
      'role': 'parent',
    };
  }

  factory Parent.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Parent(
      id: doc.id,
      name: data['name'] ?? 'name',
      email: data['email'] ?? '',
      gender: data['gender'] ?? 'gender',
      imageURL: data['imageURL'] ?? profilePlaceholderURL,
      plan: data['plan'] ?? 'free',
      PIN: data['PIN'] ?? '',
      children: List<String>.from(data['children']),
      transactions: List<String>.from(data['transactions']),
    );
  }
}
