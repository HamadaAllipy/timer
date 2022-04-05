import 'package:equatable/equatable.dart';

abstract class TimerEvents extends Equatable{

  const TimerEvents();

  @override
  List<Object?> get props => [];
}

class PlayEvent extends TimerEvents{
  final int duration;
  const PlayEvent({required this.duration});

  @override
  String toString() {
    return 'PlayEvent{duration: $duration}';
  }
}

class PauseEvent extends TimerEvents{}

class ResumeEvent extends TimerEvents{}

class ResetEvent extends TimerEvents{}

class TickEvent extends TimerEvents{
  final int duration;

  const TickEvent({required this.duration});

  @override
  // TODO: implement props
  List<Object?> get props => [duration];

  @override
  String toString() {
    return 'TickEvent{duration: $duration}';
  }
}