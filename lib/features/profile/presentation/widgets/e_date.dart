extension DateTimeExtensions on DateTime {
  String differenceInYearsMonthsDays(DateTime other) {
    Duration difference = this.difference(other);

    int years = (difference.inDays / 365).floor();
    int months = ((difference.inDays % 365) / 30).floor();
    int days = (difference.inDays % 30);

    return '$years years, $months months';
  }
}