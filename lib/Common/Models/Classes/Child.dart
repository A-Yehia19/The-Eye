import 'User.dart';

class Child extends User {
  final String parentID;
  final String PIN;
  final DateTime birthDate;
  late List<String> history;
  late List<String> likes;
  late List<String> favourites;
  late List<String> prefs;
  late List<String> screenTime;

  Child({
    required String id,
    required String role,
    required String gender,
    required String name,
    String imageURL = '',
    required this.parentID,
    required this.PIN,
    required this.birthDate,

    List<String>? likes,
    List<String>? favourites,
    List<String>? prefs,
    List<String>? screenTime,
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
      this.screenTime = [];
    }
  }
}