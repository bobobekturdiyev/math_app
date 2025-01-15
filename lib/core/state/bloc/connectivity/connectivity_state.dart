part of 'connectivity_bloc.dart';

abstract class ConnectivityState extends Equatable {
  const ConnectivityState();
}

class ConnectivityInitial extends ConnectivityState {
  @override
  List<Object> get props => [];
}

class OfflineState extends ConnectivityState {
  @override
  List<Object> get props => [];
}

class OnlineState extends ConnectivityState {
  @override
  List<Object> get props => [];
}
