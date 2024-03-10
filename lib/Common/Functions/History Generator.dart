String historyGenerator(DateTime time) {
  String history = "";
  DateTime now = DateTime.now();
  Duration difference = now.difference(time);
  if (difference.inDays > 365) {
    history = "${(difference.inDays / 365).floor()} Years Ago";
  } else if (difference.inDays > 30) {
    history = "${(difference.inDays / 30).floor()} Months Ago";
  } else if (difference.inDays > 0) {
    history = "${difference.inDays} Days Ago";
  } else if (difference.inHours > 0) {
    history = "${difference.inHours} Hours Ago";
  } else if (difference.inMinutes > 0) {
    history = "${difference.inMinutes} Minutes Ago";
  } else if (difference.inSeconds > 0) {
    history = "${difference.inSeconds} Seconds Ago";
  }
  return history;
}
