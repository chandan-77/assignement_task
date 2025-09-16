import 'dart:async';
import 'package:flutter/material.dart';

class DurationWidget extends StatefulWidget {
  final int duration;
  final bool isPaused;

  const DurationWidget({
    super.key,
    required this.duration,
    required this.isPaused,
  });

  @override
  State<DurationWidget> createState() => _DurationWidgetState();
}

class _DurationWidgetState extends State<DurationWidget> {
  late int remainingTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.duration;
    startTimer();
  }

  @override
  void didUpdateWidget(covariant DurationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.duration != widget.duration) {
      remainingTime = widget.duration;
      timer?.cancel();
      startTimer();
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!widget.isPaused && mounted && remainingTime > 0) {
        setState(() => remainingTime--);
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.timer, size: 18, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          "$remainingTime s",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
