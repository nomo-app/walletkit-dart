extension StringExtension on String {
  bool startsWithAny(List<String> prefixes) {
    for (final prefix in prefixes) {
      if (startsWith(prefix)) {
        return true;
      }
    }
    return false;
  }
}
