import 'dart:async';

import 'package:flutter/material.dart';

class CountdownTimerProvider extends ChangeNotifier {
  int _remainingTime;
  final int _durationInSeconds;
  Timer? _timer;
  bool _isStarted = false;

  CountdownTimerProvider({
    required int durationInSeconds,
  })  : _remainingTime = durationInSeconds,
        _durationInSeconds = durationInSeconds;

  int get remainingTime => _remainingTime;

  bool get isEnded => _remainingTime == 0;

  void startTimer() {
    if (!_isStarted) {
      _isStarted = true;
      _remainingTime = _durationInSeconds;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          timer.cancel();
          _isStarted = false; // Mark timer as stopped
        }
        notifyListeners();
      });
    } else {
      resetTimer();
    }
  }

  void resetTimer() {
    _timer?.cancel(); // Cancel any existing timer

    _isStarted = false;
    startTimer();
  }

  void cancelTimer() {
    _timer?.cancel(); // Cancel the timer
    _timer = null;
    _isStarted = false; // Mark timer as stopped
  }
}
