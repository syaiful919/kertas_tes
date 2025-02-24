extension StringExtension on String {
  String getAbbreviation({int length = 2}) {
    if (isEmpty) return "";

    List<String> words = split(' ');

    // Collect the first letter of each word
    String abbreviation = '';
    for (String word in words) {
      if (word.isNotEmpty) {
        abbreviation += word[0].toUpperCase();
      }

      if (abbreviation.length >= length) {
        break;
      }
    }

    return abbreviation;
  }
}
