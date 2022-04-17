import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer/bloc/timer_bloc.dart';
import 'package:timer/constants/values.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Color(0xffB7BCF2),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.paddingTop,
                width: double.infinity,
              ),
              IconButton(
                icon: const Icon(Icons.menu,),
                onPressed: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  height: 270,
                  width: 270,
                  child: Stack(
                    fit: StackFit.expand,
                    children: const [
                      CircularProgressIndicator(
                        value: 1,
                        strokeWidth: 10,
                        color: Color(0xFFFFA300),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFEAD7FF),
                          child: TimerText(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Actions(),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/images/time_management.svg',
                  height: 150,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr =
    ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondsStr',
      style: Theme.of(context).textTheme.headline2,
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state is TimerInitial) ...[
              FloatingActionButton(
                backgroundColor: const Color(0xFFE6BAFF),
                child: const Icon(Icons.play_arrow,color: Colors.black),
                onPressed: () => context
                    .read<TimerBloc>()
                    .add(TimerStarted(duration: state.duration)),
              ),
            ],
            if (state is TimerRunInProgress) ...[
              FloatingActionButton(
                backgroundColor: const Color(0xFFE6BAFF),
                child: const Icon(Icons.pause, color: Colors.black,),
                onPressed: () => context.read<TimerBloc>().add(const TimerPaused()),
              ),
              FloatingActionButton(
                backgroundColor: const Color(0xFFE6BAFF),
                child: const Icon(Icons.replay, color: Colors.black,),
                onPressed: () => context.read<TimerBloc>().add(const TimerReset()),
              ),
            ],
            if (state is TimerRunPause) ...[
              FloatingActionButton(
                backgroundColor: const Color(0xFFE6BAFF),
                child: const Icon(Icons.play_arrow, color: Colors.black,),
                onPressed: () => context.read<TimerBloc>().add(const TimerResumed()),
              ),
              FloatingActionButton(
                backgroundColor: const Color(0xFFE6BAFF),
                child: const Icon(Icons.replay, color: Colors.black),
                onPressed: () => context.read<TimerBloc>().add(const TimerReset()),
              ),
            ],
            if (state is TimerRunComplete) ...[
              FloatingActionButton(
                backgroundColor: const Color(0xFFE6BAFF),
                child: const Icon(Icons.replay, color: Colors.black),
                onPressed: () => context.read<TimerBloc>().add(const TimerReset()),
              ),
            ]
          ],
        );
      },
    );
  }
}

