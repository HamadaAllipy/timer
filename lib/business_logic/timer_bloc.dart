import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/business_logic/timer_events.dart';
import 'package:timer/business_logic/timer_states.dart';
import 'package:timer/ticker.dart';

class TimerBloc extends Bloc<TimerEvents, TimerStates> {

  static const int _duration = 60;
  final Ticker _ticker;
  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial(_duration)){
    on<PlayEvent>(_onPlayed);
    on<PauseEvent>(_onPaused);
    on<ResumeEvent>(_onResumed);
    on<ResetEvent>(_onReset);
    on<TickEvent>(_onTicked);
    // on((event, emit) => null)
  }

  void _onPlayed(PlayEvent event, Emitter<TimerStates> emit){
    emit(TimerRunning(event.duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(ticks: event.duration).listen((duration) {
      add(TickEvent(duration: duration));
    });
  }

  void _onTicked(TickEvent event, Emitter<TimerStates> emit) {

    emit(
        event.duration > 0 ?
            TimerRunning(event.duration): const TimerFinished()
    );
  }

  void _onPaused(PauseEvent event, Emitter<TimerStates> emit) {
    if(state is TimerRunning){
      _tickerSubscription?.pause();
      emit(TimerPaused(state.duration));
    }
  }

  void _onResumed(ResumeEvent event, Emitter<TimerStates> emit) {
    if(state is TimerPaused){
      _tickerSubscription?.resume();
      emit(TimerRunning(state.duration));
    }
  }

  void _onReset(ResetEvent event, Emitter<TimerStates> emit) {
    _tickerSubscription?.cancel();
    emit(const TimerInitial(_duration));
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }
}