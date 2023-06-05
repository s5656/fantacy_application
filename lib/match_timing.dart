import 'package:fantasy_application/match.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class MyCountdownTimer extends StatefulWidget {
  final DateTime targetTime;

  const MyCountdownTimer({required this.targetTime});

  @override
  _MyCountdownTimerState createState() => _MyCountdownTimerState();


}

class _MyCountdownTimerState extends State<MyCountdownTimer> {

  late bool allZero;

  int _days = 0;
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;
  Timer? _timer;
  late DateTime _currentTime;
  late Duration _countdownDuration;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _countdownDuration = widget.targetTime.difference(_currentTime);
    startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startCountdown() {
    const oneSec = Duration(seconds: 1);

    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        _currentTime = DateTime.now();
        if (_currentTime.isBefore(widget.targetTime)) {
          _countdownDuration = widget.targetTime.difference(_currentTime);

          _days = _countdownDuration.inDays;
          _hours = _countdownDuration.inHours % 24;
          _minutes = _countdownDuration.inMinutes % 60;
          _seconds = _countdownDuration.inSeconds % 60;
        } else {
          timer.cancel();
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {

    List<String> countdownParts = [];

    if (_days > 0) {
      countdownParts.add('${_days}d');
    }
    if (_hours > 0) {
      countdownParts.add('${_hours.toString().padLeft(2, '0')}h');
    }
    if (_minutes > 0) {
      countdownParts.add('${_minutes.toString().padLeft(2, '0')}m');
    }
    countdownParts.add('${_seconds.toString().padLeft(2, '0')}s');


    allZero = countdownParts.every((countdown) => countdown == 0); //return true when all elements become zero

    return Text(
      countdownParts.join(' '),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.redAccent,
      ),
    );
  }
}
