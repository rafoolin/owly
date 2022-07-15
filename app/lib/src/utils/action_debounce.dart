import 'dart:async';

class ActionDebounce {
  final Duration duration;
  Timer? _timer;
  ActionDebounce({this.duration = const Duration(milliseconds: 400)});

  void run(ZoneCallback callback) {
    _timer?.cancel();
    _timer = Timer(duration, callback);
  }
}
