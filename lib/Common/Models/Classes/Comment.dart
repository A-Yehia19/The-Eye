class Comment{
  final String text;
  final String profileID;
  late final DateTime date;

  Comment({
    required this.text,
    required this.profileID,
    date
  }){
    if (date != null) {
      this.date = date;
    } else {
      this.date = DateTime.now();
    }
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      text: map['text'],
      profileID: map['profileID'],
      date: map['date'].toDate(),
    );
  }
}
