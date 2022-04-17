import 'package:flutter/material.dart';
import 'package:timer/view/pages/home_screen.dart';

class TimerApp extends MaterialApp {
  const TimerApp({Key? key})
      : super(
            key: key,
            debugShowCheckedModeBanner: false,
            home: const HomeScreen());
}
