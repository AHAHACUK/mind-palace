import 'dart:async';
import 'dart:ui';

class RestartableTimer {
  final Duration _duration;
  final VoidCallback _callback;
  Timer? _timer;

  DateTime? _timeStared;
  DateTime get _timeCurrent => DateTime.now();
  DateTime get timeEnd =>
      _timeStared != null ? _timeStared!.add(_duration) : _timeCurrent;

  bool get isRunning => _timer != null;

  Duration get timeSinceStart => _timeStared != null
      ? _timeCurrent.difference(_timeStared!)
      : Duration.zero;

  Duration get timeLeft {
    if (_timeStared == null) return Duration.zero;
    return timeEnd.difference(_timeCurrent);
  }

  RestartableTimer({
    required Duration duration,
    required VoidCallback callback,
  })  : _duration = duration,
        _callback = callback;

  void start() {
    _timeStared = DateTime.now();
    _timer = Timer(_duration, _callback);
  }

  void restart() {
    stop();
    start();
  }

  void stop() {
    _timer?.cancel();
    _timeStared = null;
    _timer = null;
  }
}
