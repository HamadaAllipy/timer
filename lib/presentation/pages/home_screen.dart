import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timer/constants/values.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                icon: Icon(Icons.menu,),
                onPressed: (){},
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
                    children: [
                      const CircularProgressIndicator(
                        value: 1,
                        strokeWidth: 10,
                        color: Color(0xFFFFA300),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFFEAD7FF),
                          child: Text(
                            '14:16',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Visibility(
                  visible: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(0xFFE6BAFF),
                          radius: 35,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              print('hamada');
                            },
                            icon: const Icon(
                              Icons.pause,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: const Color(0xFFE6BAFF),
                          radius: 35,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              print('hamada');
                            },
                            icon: const Icon(
                              Icons.replay,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Visibility(
                  visible: false,
                  child: CircleAvatar(
                    backgroundColor: const Color(0xFFE6BAFF),
                    radius: 35,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        print('hamada');
                      },
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
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
