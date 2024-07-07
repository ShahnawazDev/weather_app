extension StringExtension on String {
  // Capitalizes the first letter of each word in the string.
  String capitalizeWords() {
    return split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}
