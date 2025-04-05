part of 'app_bloc.dart';

sealed class AppState extends Equatable {
  const AppState();
}

final class AppInitial extends AppState {
  @override
  List<Object> get props => [];
}

final class AppLoading extends AppState {
  @override
  List<Object> get props => [];
}

final class AppError extends AppState {
  final String message;

  const AppError({required this.message});

  @override
  List<Object> get props => [message];
}

final class AppLoaded extends AppState {
  final AppDto appDto;

  const AppLoaded({required this.appDto});

  @override
  List<Object> get props => [appDto];
}
