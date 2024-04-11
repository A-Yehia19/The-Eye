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

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'profileID': profileID,
      'date': date,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      text: map['text'],
      profileID: map['profileID'],
      date: map['date'].toDate(),
    );
  }
}
