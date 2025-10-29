import 'dart:async';
import 'dart:ui';

import 'package:dartz/dartz.dart';

class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer({this.delay = const Duration(milliseconds: 300)});

  call(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(delay, action);
  }

  void dispose() => _timer != null ? _timer!.cancel() : unit;
}
