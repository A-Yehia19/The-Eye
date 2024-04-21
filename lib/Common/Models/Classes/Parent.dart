import 'User.dart';

class Parent extends User {
  final String plan;
  late List<String> children;
  late List<String> transactions;

  Parent({
    required String id,
    required String gender,
    required String name,
    String imageURL = '',
    this.plan = "free",

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
      id: map['id'],
      gender: map['gender'],
      name: map['name'],
      imageURL: map['imageURL'],
      children: List<String>.from(map['children']),
      transactions: List<String>.from(map['transactions']),
    );
  }
}