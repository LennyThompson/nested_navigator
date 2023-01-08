import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TimerState {
  initial,
  started,
  paused,
  finished,
}

class TimerModel {
  const TimerModel(this._timeLeft, this._timerState);
  final int _timeLeft;
  final TimerState _timerState;

  get timerState => _timerState;
}


class TimerNotifier extends StateNotifier<TimerModel> {
  TimerNotifier(super.state);

  final Ticker _ticker = Ticker();
  StreamSubscription<int>? _tickerSubscription;

  void start() {
    if (state._timerState == TimerState.paused) {
      _restartTimer();
    } else {
      _startTimer();
    }
  }

  void _restartTimer() {
    _tickerSubscription?.resume();
    state = TimerModel(state._timeLeft, TimerState.started);
  }

  void _startTimer() {
    _tickerSubscription?.cancel();

    _tickerSubscription =
        _ticker.tick(ticks: 3).listen((duration) {
      state = TimerModel(duration, TimerState.started);
    });

    _tickerSubscription?.onDone(() {
      state = TimerModel(0, TimerState.finished);
    });

    state = TimerModel(3, TimerState.started);
  }

  void pause() {
    _tickerSubscription?.pause();
    state = TimerModel(state._timeLeft, TimerState.paused);
  }

  void reset() {
    _tickerSubscription?.cancel();
    state = TimerModel(3, TimerState.initial);
  }

  @override
  void dispose() {
    _tickerSubscription?.cancel();
    super.dispose();
  }
}

class Ticker {
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(
      const Duration(seconds: 1),
      (x) => ticks - x - 1,
    ).take(ticks);
  }
}

final timerNotifierProvider = StateNotifierProvider<TimerNotifier, TimerModel>((ref) {
  TimerNotifier timer = TimerNotifier(TimerModel(3, TimerState.initial));
  return timer;
});

final timerCompleteProvider = Provider<bool>((ref) {
  TimerModel timer = ref.watch(timerNotifierProvider);
  if(timer.timerState == TimerState.finished)
  {
    return true;
  }
  return false;
},);

