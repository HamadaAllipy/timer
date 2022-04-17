import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/app.dart';
import 'package:timer/app_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const TimerApp()),
    blocObserver: AppObserver(),
  );
}
