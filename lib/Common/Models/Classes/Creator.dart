import 'User.dart';

class Creator extends User{
  late List<String> transactions;
  late List<String> videos;

  Creator({
    required String id,
    required String gender,
    required String name,
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
      id: map['id'],
      gender: map['gender'],
      name: map['name'],
      imageURL: map['imageURL'],
      transactions: List<String>.from(map['transactions']),
      videos: List<String>.from(map['videos']),
    );
  }
}
