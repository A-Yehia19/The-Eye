class User{
  final String id;
  final String role;
  final String gender;
  String name;
  String imageURL;

  User({
    required this.id,
    required this.gender,
    required this.name,
    required this.role,
    this.imageURL = ""
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      role: map['role'],
      gender: map['gender'],
      name: map['name'],
      imageURL: map['imageURL'],
    );
  }
}