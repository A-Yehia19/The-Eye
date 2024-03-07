import 'User.dart';

class Comment{
  final String text;
  final User profile;
  late final DateTime date;

  Comment({
    required this.text,
    required this.profile,
    date
  }){
    if (date != null) {
      this.date = date;
    } else {
      this.date = DateTime.now();
    }
  }
}