// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'home/bar_controller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Soccer Point",
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 1, 6, 34),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimationLimiter(
                child: AnimationConfiguration.synchronized(
                  duration: const Duration(milliseconds: 900),
                  child: SlideAnimation(
                    delay: Duration(seconds: 1),
                    curve: Curves.linear,
                    child: FadeInAnimation(
                      child: Image.asset(
                        "assets/images/ronaldo.png",
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              AnimationLimiter(
                child: AnimationConfiguration.synchronized(
                  duration: const Duration(milliseconds: 900),
                  child: SlideAnimation(
                    delay: Duration(seconds: 1),
                    curve: Curves.linearToEaseOut,
                    child: FadeInAnimation(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: DefaultTextStyle(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Welcome to the Soccer Point App! \n\nHere, you will always be connected to the world of football. Get live scores and the latest news about your favorite teams easily and quickly.\n\nStart exploring the world of football with us! \nPress the "Start" button to begin your experience.',
                                textAlign: TextAlign.start,
                                speed: Duration(milliseconds: 150),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              AnimationLimiter(
                child: AnimationConfiguration.synchronized(
                  duration: const Duration(milliseconds: 900),
                  child: SlideAnimation(
                    delay: Duration(seconds: 1),
                    curve: Curves.easeInToLinear,
                    child: FadeInAnimation(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BarController(),
                            ),
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.yellow,
                          ),
                          child: Center(
                            child: Text(
                              "Start!",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
