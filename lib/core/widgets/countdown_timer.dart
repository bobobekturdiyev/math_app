import 'dart:async';

import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class CountdownTimer extends StatefulWidget {
  final int durationInSeconds;
  final VoidCallback onTimerEnd;
  final bool isColored;
  final VoidCallback? warningCallback; // Optional callback for warnings

  const CountdownTimer({
    super.key,
    required this.durationInSeconds,
    required this.onTimerEnd,
    this.warningCallback,
    this.isColored = true,
  });

  @override
  CountdownTimerState createState() => CountdownTimerState();
}

class CountdownTimerState extends State<CountdownTimer> {
  late int _remainingTime;
  Timer? _timer;
  bool _warningTriggered =
      false; // Track if the warningCallback has been triggered
  Color textColor = AppColors.grey;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.durationInSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });

        // Trigger the warning callback when 15 seconds are left
        if (_remainingTime == 15 && !_warningTriggered) {
          _warningTriggered = true;
          if (widget.warningCallback != null) {
            widget.warningCallback!();
          }
        }
      } else {
        _timer?.cancel();
        widget.onTimerEnd(); // Trigger the callback when the timer ends
      }
    });
  }

  String _formatTime(int seconds) {
    final hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$secs";
  }

  @override
  void dispose() {
    _timer?.cancel(); // Clean up the timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isColored) {
      if (_remainingTime <= 15) {
        textColor = AppColors.danger;
      } else if (_remainingTime <= 60) {
        textColor = AppColors.yellowDark;
      }
    }

    return Text(
      _formatTime(_remainingTime),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: textColor, // Change text color to red
      ),
    );
  }
}
