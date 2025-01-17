import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resources/app_colors.dart';
import '../state/provider/countdown_provider.dart';

class CountdownTimerWithProvider extends StatelessWidget {
  final VoidCallback onTimerEnd;

  const CountdownTimerWithProvider({
    super.key,
    required this.onTimerEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CountdownTimerProvider>(
      builder: (context, timerProvider, child) {
        // Check if the timer has ended
        if (timerProvider.isEnded) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            onTimerEnd();
          });
        }

        return Text(
          _formatTime(timerProvider.remainingTime),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.grey,
          ),
        );
      },
    );
  }

  String _formatTime(int seconds) {
    final minutes = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }
}
