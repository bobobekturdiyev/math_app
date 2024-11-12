part of 'bottom_nav_bar_bloc.dart';

abstract class BottomNavBarState extends Equatable {
  final int index;

  const BottomNavBarState({required this.index});

  @override
  List<Object> get props => [index];
}

class BottomNavBarInitial extends BottomNavBarState {
  const BottomNavBarInitial({required super.index});

  @override
  List<Object> get props => [];
}

class ChangePageIndex extends BottomNavBarState {
  final bool sameRoute;
  final String route;
  const ChangePageIndex({
    required super.index,
    this.sameRoute = false,
    required this.route,
  });
}

class ClearRouteState extends BottomNavBarState {
  const ClearRouteState({required super.index});
}

class ChangePage extends BottomNavBarState {
  final String routePath;

  const ChangePage({required this.routePath, required super.index});

  @override
  List<Object> get props => [routePath];
}
