part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();
}

class LoadAppData extends AppEvent {
  @override
  List<Object?> get props => [];
}
