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
}