List<List<String>> generatePrefsOptions(List<String> prefs) {
  final List<List<String>> options = [[]];
  for (final tag in prefs) {
    final List<List<String>> newOptionToAdd = [];
    for (final option in options) {
      for (int i = 0; i <= option.length; i++) {
        final List<String> newOption = List.from(option);
        newOption.insert(i, tag);
        newOptionToAdd.add(newOption);
      }
    }
    options.addAll(newOptionToAdd);
  }

  print(options.length);
  return options;
}

// List<List<String>> generatePrefsOptions(List<String> prefs) {
//   final List<List<String>> options = [[]];
//   for (final tag in prefs) {
//     final List<List<String>> newOptionToAdd = [];
//     for (final option in options) {
//       final List<String> newOption = List.from(option);
//       newOption.add(tag);
//       newOption.sort();
//       newOptionToAdd.add(newOption);
//     }
//     options.addAll(newOptionToAdd);
//   }
//
//   print(options.length);
//   return options;
// }
