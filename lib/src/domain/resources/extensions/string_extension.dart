extension StringExtension on String {
  String captalize() {
    if (isNotEmpty) {
      return this[0].toUpperCase() + substring(1);
    }
    return this;
  }

  String pokeID() {
    String newString = this;
    while (newString.length < 4) {
      newString = '0$newString';
    }
    return '#$newString';
  }
}
