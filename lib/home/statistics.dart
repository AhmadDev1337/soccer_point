// ignore_for_file: unused_field

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class JsonData {
  final String image1;
  final String team1;
  final String image2;
  final String team2;
  final String score1;
  final String score2;
  final String possesion1;
  final String possesion2;
  final String shot1;
  final String shot2;
  final String shotOnTarget1;
  final String shotOnTarget2;
  final String passes1;
  final String passes2;
  final String passesAccuracy1;
  final String passesAccuracy2;
  final String yellowCards1;
  final String yellowCards2;
  final String redCards1;
  final String redCards2;
  final String offsides1;
  final String offsides2;
  final String cornerKicks1;
  final String cornerKicks2;
  final String violation1;
  final String violation2;

  JsonData({
    required this.image1,
    required this.team1,
    required this.image2,
    required this.team2,
    required this.score1,
    required this.score2,
    required this.possesion1,
    required this.possesion2,
    required this.shot1,
    required this.shot2,
    required this.shotOnTarget1,
    required this.shotOnTarget2,
    required this.passes1,
    required this.passes2,
    required this.passesAccuracy1,
    required this.passesAccuracy2,
    required this.yellowCards1,
    required this.yellowCards2,
    required this.redCards1,
    required this.redCards2,
    required this.offsides1,
    required this.offsides2,
    required this.cornerKicks1,
    required this.cornerKicks2,
    required this.violation1,
    required this.violation2,
  });
}

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<JsonData> jsonDataList = [];
  bool isExpanded = false;
  bool isLoading = true;

  Future<void> statistic() async {
    const jsonUrl = 'https://pastebin.com/raw/jCq72U7d';

    try {
      final response = await http.get(Uri.parse(jsonUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        jsonDataList = jsonData.map<JsonData>((data) {
          return JsonData(
            image1: data['image1'],
            team1: data['team1'],
            image2: data['image2'],
            team2: data['team2'],
            score1: data['score1'],
            score2: data['score2'],
            possesion1: data['possesion1'],
            possesion2: data['possesion2'],
            shot1: data['shot1'],
            shot2: data['shot2'],
            shotOnTarget1: data['shotOnTarget1'],
            shotOnTarget2: data['shotOnTarget2'],
            passes1: data['passes1'],
            passes2: data['passes2'],
            passesAccuracy1: data['passesAccuracy1'],
            passesAccuracy2: data['passesAccuracy2'],
            yellowCards1: data['yellowCards1'],
            yellowCards2: data['yellowCards2'],
            redCards1: data['redCards1'],
            redCards2: data['redCards2'],
            offsides1: data['offsides1'],
            offsides2: data['offsides2'],
            cornerKicks1: data['cornerKicks1'],
            cornerKicks2: data['cornerKicks2'],
            violation1: data['violation1'],
            violation2: data['violation2'],
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
      log('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    statistic();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Soccer Point",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 1, 6, 34),
          title: const Text(
            "Match Stats",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 1, 6, 34),
        body: isLoading
            ? const Center(
                child: SpinKitWave(
                  color: Color(0xff1e90ff),
                  size: 25,
                ),
              )
            : ListView(
                children: jsonDataList.map((jsonData) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: isExpanded
                                ? const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromARGB(255, 255, 13, 0),
                                      Color.fromARGB(255, 12, 75, 126),
                                    ],
                                  )
                                : null,
                            color: !isExpanded
                                ? const Color.fromARGB(255, 1, 6, 34)
                                : null,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.network(
                                    jsonData.image1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    jsonData.team1,
                                    style: TextStyle(
                                        color: isExpanded
                                            ? Colors.white
                                            : Colors.grey),
                                  ),
                                ],
                              ),
                              Text(
                                "VS",
                                style: TextStyle(
                                    color:
                                        isExpanded ? Colors.white : Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              Column(
                                children: [
                                  Image.network(
                                    jsonData.image2,
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    jsonData.team2,
                                    style: TextStyle(
                                        color: isExpanded
                                            ? Colors.white
                                            : Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isExpanded)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    jsonData.score1,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Text(
                                    "Goal",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    jsonData.score2,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    jsonData.possesion1,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Text(
                                    "Possesion",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    jsonData.possesion2,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    jsonData.shot1,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Text(
                                    "Shot",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    jsonData.shot2,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    jsonData.shotOnTarget1,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Text(
                                    "Shot on Target",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    jsonData.shotOnTarget2,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    jsonData.passes1,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Text(
                                    "Passes",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    jsonData.passes2,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    jsonData.passesAccuracy1,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Text(
                                    "Passes Accuracy",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    jsonData.passesAccuracy2,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    jsonData.yellowCards1,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Text(
                                    "Yellow Cards",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    jsonData.yellowCards2,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    jsonData.redCards1,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Text(
                                    "Red Cards",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    jsonData.redCards2,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    jsonData.offsides1,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Text(
                                    "Offsides",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    jsonData.offsides2,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    jsonData.cornerKicks1,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Text(
                                    "Corner Kicks",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    jsonData.cornerKicks2,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    jsonData.violation1,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Text(
                                    "Violation",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    jsonData.violation2,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
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
