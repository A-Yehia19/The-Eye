List<List<String>> generatePrefsOptions(List<String> prefs) {
  final List<List<String>> options = [[]];
  for (final tag in prefs) {
    final List<List<String>> newOptionToAdd = [];
    for (final option in options) {
      final List<String> newOption = List.from(option);
      newOption.add(tag);
      newOption.sort();
      newOptionToAdd.add(newOption);
    }
    options.addAll(newOptionToAdd);
  }

  print(options.length);
  return options;
}
