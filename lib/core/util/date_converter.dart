class DateConverter {
  static String unixTimeToDateString(int unixTime) {
    final DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    final String day = dateTime.day.toString().padLeft(2, '0');
    final String month = dateTime.month.toString().padLeft(2, '0');
    final String year = dateTime.year.toString();
    return '$day/$month/$year';
  }

  static DateTime unixTimeToDateTime(int unixTime) {
    return DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
  }
}
