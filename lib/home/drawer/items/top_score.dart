// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class Matchs {
  final String image1;
  final String image2;
  final String player;
  final String goal;

  Matchs({
    required this.image1,
    required this.image2,
    required this.player,
    required this.goal,
  });
}

class TopScorePage extends StatefulWidget {
  const TopScorePage({super.key});

  @override
  State<TopScorePage> createState() => _TopScorePageState();
}

class _TopScorePageState extends State<TopScorePage> {
  List<Matchs> matchsList = [];
  bool isLoading = true;

  Future<void> match() async {
    const singleJsonUrl = "https://pastebin.com/raw/33SCkHyy";

    try {
      final response = await http.get(Uri.parse(singleJsonUrl));
      if (response.statusCode == 200) {
        final matchs = json.decode(response.body);
        matchsList = matchs.map<Matchs>((data) {
          return Matchs(
            player: data['player'],
            goal: data['goal'],
            image1: data['image1'],
            image2: data['image2'],
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
    match();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: SpinKitWave(
              color: Color(0xff1e90ff),
              size: 25,
            ),
          )
        : Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Player",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: matchsList.map((matchs) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Image.network(matchs.image1, width: 20),
                                  SizedBox(width: 5),
                                  Image.network(matchs.image2, width: 20),
                                  SizedBox(width: 10),
                                  Text(
                                    matchs.player,
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.grey),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Goal",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: matchsList.map((matchs) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                matchs.goal,
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
