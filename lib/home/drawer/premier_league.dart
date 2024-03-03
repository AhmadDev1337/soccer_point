// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class Matchs {
  final String week;
  final String image1;
  final String team1;
  final String image2;
  final String team2;
  final String date;
  final String time;

  Matchs({
    required this.week,
    required this.image1,
    required this.team1,
    required this.image2,
    required this.team2,
    required this.date,
    required this.time,
  });
}

class PremierLeaguePage extends StatefulWidget {
  const PremierLeaguePage({super.key});

  @override
  State<PremierLeaguePage> createState() => _PremierLeaguePageState();
}

class _PremierLeaguePageState extends State<PremierLeaguePage> {
  List<Matchs> matchsList = [];
  bool isLoading = true;

  Future<void> match() async {
    const singleJsonUrl = "https://pastebin.com/raw/xaZxCKiG";

    try {
      final response = await http.get(Uri.parse(singleJsonUrl));
      if (response.statusCode == 200) {
        final matchs = json.decode(response.body);
        matchsList = matchs.map<Matchs>((data) {
          return Matchs(
              week: data["week"],
              image1: data["image1"],
              team1: data['team1'],
              image2: data['image2'],
              team2: data['team2'],
              date: data['date'],
              time: data['time']);
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
      Scaffold(
        backgroundColor: Colors.white,
        body: Container(
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Soccer Point",
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back, color: Colors.white),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "back",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "2024",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xff1e90ff),
        ),
        backgroundColor: Color.fromARGB(255, 1, 6, 34),
        body: ListView(
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 40, bottom: 25),
              color: Color(0xff1e90ff),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/images-removebg-preview (1).png",
                    width: 70,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "English Premier League",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/mc.png",
                            width: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "England",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            isLoading
                ? Center(
                    child: SpinKitWave(
                      color: Color(0xff1e90ff),
                      size: 25,
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Text(
                            "Statistic",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Text(
                            "Classement",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Text(
                            "Top Score",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: matchsList.map((matchs) {
                  return ListTile(
                    onTap: () {},
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              matchs.team1,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image.network(
                              matchs.image1,
                              width: 25,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              matchs.time,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              matchs.date,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.network(
                              matchs.image2,
                              width: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              matchs.team2,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
