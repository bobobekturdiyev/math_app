part of 'category_home_bloc.dart';

abstract class CategoryHomeEvent extends Equatable {
  const CategoryHomeEvent();
}

class LoadCategories extends CategoryHomeEvent {
  @override
  List<Object?> get props => [];
}

class CategoryHomeSelect extends CategoryHomeEvent {
  final int id;

  const CategoryHomeSelect({required this.id});

  @override
  List<Object?> get props => [id];
}

class CategoryHomeHideSelect extends CategoryHomeEvent {
  const CategoryHomeHideSelect();

  @override
  List<Object?> get props => [];
}
