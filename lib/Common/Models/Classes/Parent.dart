import 'dart:ffi';

import 'User.dart';

class Parent extends User {
  final String plan;
  final String email;
  final bool isParent;
  final String role;
  late List<String> children;
  late List<String> transactions;

  Parent({
    required String id,
    required String gender,
    required String name,
    required this.email,
    String imageURL = '',
    this.plan = "free",
    this.isParent = true,
    this.role = "parent",

    List<String>? children,
    List<String>? transactions,
  }) : super(id: id, role: "creator", gender: gender, name: name, imageURL: imageURL) {
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
      gender: map['gender'] ?? '',
      name: map['name'] ?? '',
      imageURL: map['imageURL'] ?? '',
      children: map['children'] != null ? List<String>.from(map['children']) : [],
      transactions: map['transactions'] != null ? List<String>.from(map['transactions']) : [],
      email: map['email'] ?? '',
      plan: map['plan'] ?? 'free',
      isParent: map['isParent'] ?? true,
      role: 'parent',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isParent': isParent,
      'email': email,
      'gender': gender,
      'name': name,
      'imageURL': imageURL,
      'plan': plan,
      'children': children,
      'transactions': transactions,
      'role': 'parent',
    };
  }
}