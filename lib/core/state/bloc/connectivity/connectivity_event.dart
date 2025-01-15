part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();
}

class GoOffline extends ConnectivityEvent {
  @override
  List<Object?> get props => [];
}

class GoOnline extends ConnectivityEvent {
  @override
  List<Object?> get props => [];
}

class CheckConnection extends ConnectivityEvent {
  @override
  List<Object?> get props => [];
}
