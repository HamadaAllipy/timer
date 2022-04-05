import 'dart:async';

import 'package:equatable/equatable.dart';

/// timer initial , timer running , timer pause , timer finish
abstract class TimerStates extends Equatable {

  final int duration;

  const TimerStates(this.duration);

  @override
  List<Object?> get props => [duration];
}

class TimerInitial extends TimerStates {

  const TimerInitial(int duration): super(duration);

  @override
  String toString() {
    return 'TimerInitial{ duration $duration}';
  }
}

class TimerRunning extends TimerStates{
  const TimerRunning(int duration) : super(duration);
}

class TimerPaused extends TimerStates{
  const TimerPaused(int duration) : super(duration);
}

class TimerFinished extends TimerStates{
  const TimerFinished() : super(0);
}