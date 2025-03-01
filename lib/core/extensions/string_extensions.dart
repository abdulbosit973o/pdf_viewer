extension StringExtensions on String {
  String get pngIcon => 'assets/icons/$this.png';

  String get pngImage => 'assets/images/$this.png';

  String get svgIcon => 'assets/vectors/$this.svg';

  String get svgImage => 'assets/images/$this.svg';

  bool isImageUrl() {
    return startsWith('http://') || startsWith('https://');
  }

  bool isFilePath() {
    return startsWith('/') || startsWith(RegExp(r'^[a-zA-Z]:\\'));
  }

  String clean() {
    return replaceAll(',', '').trim();
  }

  String cleanHtml() {
    final regex = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: false);
    return replaceAll(regex, '');
  }

  int toInt({int defaultValue = 0}) {
    return int.tryParse(this) ?? defaultValue;
  }

  String toUpperFirstLetter() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
