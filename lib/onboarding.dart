// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import 'home/bar_controller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Soccer Point",
      home: OnBoardingSlider(
        headerBackgroundColor: Color.fromARGB(255, 1, 6, 34),
        skipTextButton: Text('Skip'),
        trailing: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BarController(),
                ),
              );
            },
            child: Text('Login')),
        background: [
          Container(
            color: Color.fromARGB(255, 1, 6, 34),
          ),
          Container(
            color: Color.fromARGB(255, 1, 6, 34),
          ),
        ],
        totalPage: 2,
        speed: 9,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text(
                  'Description Text 1',
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Open'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
