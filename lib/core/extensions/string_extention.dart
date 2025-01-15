extension ReadMore on String {
  /// Returns the first 100 characters of the string followed by `...` if it exceeds 100 characters.
  String readMore({int maxLength = 50}) {
    if (length <= maxLength) {
      return this;
    }
    return '${substring(0, maxLength)}...';
  }
}
