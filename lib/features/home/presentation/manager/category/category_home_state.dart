part of 'category_home_bloc.dart';


abstract class CategoryHomeState extends Equatable {
  const CategoryHomeState();
}

class CategoryHomeInitial extends CategoryHomeState {
  @override
  List<Object> get props => [];
}

class CategoryHomeLoading extends CategoryHomeState {
  @override
  List<Object> get props => [];
}

class CategoryHomeLoaded extends CategoryHomeState {

  final List<CategoryDto> categories;

  const CategoryHomeLoaded({
    required this.categories
});

  @override
  List<Object> get props => [categories];
}

class CategoryHomeError extends CategoryHomeState {
  final String message;

  const CategoryHomeError({required this.message});

  @override
  List<Object> get props => [message];
}
