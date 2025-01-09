import 'package:intl/intl.dart';

abstract class Helper {
  static String priceFormat(int price) {
    final formatter =
        NumberFormat("#,##0", "en_US"); // Use 'en_US' for comma separation
    return "${formatter.format(price)} so'm";
  }
}
