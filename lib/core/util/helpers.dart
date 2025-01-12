import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:math_app/config/routes/route_path.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/state/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';

abstract class Helper {
  static String priceFormat(int price) {
    final formatter =
        NumberFormat("#,##0", "en_US"); // Use 'en_US' for comma separation
    return "${formatter.format(price)} so'm";
  }

  static void openLogin(BuildContext context) {
    locator<BottomNavBarBloc>().add(OpenPage(path: RoutePath.profile));

    context.router.popUntilRouteWithPath(RoutePath.main);
  }
}
