import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  bool isOffline = false;

  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<GoOffline>((event, emit) async {
      emit(OfflineState());
    });

    on<GoOnline>((event, emit) async {
      emit(OnlineState());
    });

    on<CheckConnection>((event, emit) async {
      emit(OnlineState());
    });

    _checkConnection();
  }

  _checkConnection() async {
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      final isOffline = results.contains(ConnectivityResult.none);

      if (kDebugMode) {
        print(isOffline);
      }
      if (isOffline) {
        add(GoOffline());

        _goOffline();
      } else {
        add(GoOnline());

        _goOnline();
      }
    });
  }

  _goOffline() {
    if (kDebugMode) {
      print("Go offline");
    }
    add(GoOffline());
  }

  _goOnline() {
    if (kDebugMode) {
      print("Go online");
    }
    add(GoOnline());
  }
}
