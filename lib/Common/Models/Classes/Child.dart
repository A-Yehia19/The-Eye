import 'User.dart';

class Child extends User {
  final String parentID;
  final String PIN;
  final DateTime birthDate;
  late List<Map<String, dynamic>> history;
  late List<String> likes;
  late List<String> favourites;
  late List<String> prefs;
  late Map<String, double> screenTime;

  Child({
    required String id,
    required String gender,
    required String name,
    String imageURL = '',
    required this.parentID,
    required this.PIN,
    required this.birthDate,

    List<String>? likes,
    List<String>? favourites,
    List<String>? prefs,
    Map<String, double>? screenTime,
    List<Map<String, dynamic>>? history,
  }) : super(id: id, role: "creator", gender: gender, name: name, imageURL: imageURL) {
    if (likes != null) {
      this.likes = likes;
    } else {
      this.likes = [];
    }
    if (favourites != null) {
      this.favourites = favourites;
    } else {
      this.favourites = [];
    }
    if (prefs != null) {
      this.prefs = prefs;
    } else {
      this.prefs = [];
    }
    if (screenTime != null) {
      this.screenTime = screenTime;
    } else {
      this.screenTime = {'sun': 0, 'mon': 0, 'tue': 0, 'wed': 0, 'thu': 0, 'fri': 0, 'sat': 0};
    }
    if (history != null) {
      this.history = history;
    } else {
      this.history = [];
    }
  }
}
