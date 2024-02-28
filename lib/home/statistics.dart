// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  List<Map<String, dynamic>> statistics = [
    {
      "image1": "assets/images/images-removebg-preview (2).png",
      "team1": "Real Madrid",
      "image2": "assets/images/barcelona.png",
      "team2": "Barcelona",
      "score": "4 : 1",
    },
    {
      "image1": "assets/images/mc.png",
      "team1": "Man City",
      "image2": "assets/images/mu.png",
      "team2": "Man United",
      "score": "4 : 1",
    },
    {
      "image1": "assets/images/mc.png",
      "team1": "Man City",
      "image2": "assets/images/mu.png",
      "team2": "Man United",
      "score": "4 : 1",
    },
    {
      "image1": "assets/images/mc.png",
      "team1": "Man City",
      "image2": "assets/images/mu.png",
      "team2": "Man City",
      "score": "4 : 1",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Soccer Point",
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: statistics.map((statistic) {
            return ExpansionTile(
              title: Container(
                padding: EdgeInsets.all(10),
                color: Color(0xFFE1261C),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          statistic["image1"],
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          statistic["team1"],
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                      "VS",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.06,
                          fontWeight: FontWeight.w800),
                    ),
                    Column(
                      children: [
                        Image.asset(
                          statistic["image2"],
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          statistic["team2"],
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    statistic['score'],
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Color(0xFF0d0d0d),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}