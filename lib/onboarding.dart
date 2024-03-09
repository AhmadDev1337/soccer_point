// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

import 'home/bar_controller.dart';

class Informs {
  final String imageUrl;
  final String onBoarding;

  Informs({
    required this.imageUrl,
    required this.onBoarding,
  });
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  bool isLoading = true;
  List<Informs> informsList = [];

  Future<void> inform() async {
    const singleJsonUrl = "https://pastebin.com/raw/72WAyyC3";

    try {
      final response = await http.get(Uri.parse(singleJsonUrl));
      if (response.statusCode == 200) {
        final informs = json.decode(response.body);
        informsList = informs.map<Informs>((data) {
          return Informs(
            imageUrl: data['imageUrl'],
            onBoarding: data['onBoarding'],
          );
        }).toList();

        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      const Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Center(
            child: SpinKitWave(
              color: Color(0xff1e90ff),
              size: 25,
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    inform();
  }

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
            children: informsList.map((informs) {
              return Column(
                children: [
                  AnimationLimiter(
                    child: AnimationConfiguration.synchronized(
                      duration: const Duration(milliseconds: 900),
                      child: SlideAnimation(
                        delay: Duration(seconds: 1),
                        curve: Curves.linear,
                        child: FadeInAnimation(
                          child: Image.network(
                            informs.imageUrl,
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
                        curve: Curves.linear,
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
                                    informs.onBoarding,
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
                        curve: Curves.linear,
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
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
