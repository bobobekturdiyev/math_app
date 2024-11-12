import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../config/routes/route_data.dart';
import '../../../../config/routes/route_path.dart';
import '../../../../config/routes/router.gr.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  late String currentPath;

  BottomNavBarBloc() : super(const BottomNavBarInitial(index: 0)) {
    currentPath = routesData.first.path;

    on<OpenPage>((event, emit) {
      final path = event.path;

      final index = routesData.indexWhere((element) => element.path == path);

      if (index >= 0 && index < routesData.length) {
        if (currentPath == path) {
          emit(ChangePageIndex(index: index, sameRoute: true, route: path));
        } else {
          emit(ChangePageIndex(
            index: index,
            route: path,
          ));
        }

        currentPath = path;
      }
    });
  }
  //
  // final List<dynamic> routesData = [
  final List<TabRouteData> routesData = [
    const TabRouteData(path: RoutePath.home, routeInfo: RootHome()),
    const TabRouteData(path: RoutePath.myCourse, routeInfo: RootMyCourse()),
    const TabRouteData(path: RoutePath.chat, routeInfo: RootChat()),
    const TabRouteData(path: RoutePath.profile, routeInfo: RootProfile()),
  ];

  getRoutes() {
    List<PageRouteInfo<dynamic>> routes = [];
    for (var item in routesData) {
      routes.add(item.routeInfo);
    }

    return routes;
  }
}
