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
  // final String score1;
  // final String score2;
  // final String shoot1;
  // final String shoot2;
  // final String pass1;
  // final String pass2;

  JsonData({
    required this.image1,
    required this.team1,
    required this.image2,
    required this.team2,
    // required this.score1,
    // required this.score2,
    // required this.shoot1,
    // required this.shoot2,
    // required this.pass1,
    // required this.pass2,
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
    const jsonUrl = 'https://pastebin.com/raw/xaZxCKiG';

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
            // score1: data['score1'],
            // score2: data['score2'],
            // shoot1: data['shoot1'],
            // shoot2: data['shoot2'],
            // pass1: data['pass1'],
            // pass2: data['pass2'],
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
          backgroundColor: Colors.white,
          title: Text("Statistics"),
        ),
        backgroundColor: Colors.white,
        body: isLoading
            ? Center(
                child: SpinKitWave(
                  color: Color.fromARGB(255, 255, 13, 0),
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
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: isExpanded
                                ? LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromARGB(255, 255, 13, 0),
                                      Color.fromARGB(255, 12, 75, 126),
                                    ],
                                  )
                                : null,
                            color: !isExpanded ? Colors.white : null,
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
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    jsonData.team1,
                                    style: TextStyle(
                                        color: isExpanded
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ],
                              ),
                              Text(
                                "VS",
                                style: TextStyle(
                                    color: isExpanded
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                    fontWeight: FontWeight.w800),
                              ),
                              Column(
                                children: [
                                  Image.network(
                                    jsonData.image2,
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    jsonData.team2,
                                    style: TextStyle(
                                        color: isExpanded
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // if (isExpanded)
                      //   Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 30, vertical: 20),
                      //     child: Column(
                      //       children: [
                      //         Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text(
                      //               jsonData.score1,
                      //               textAlign: TextAlign.justify,
                      //               style: const TextStyle(
                      //                 color: Color(0xFF0d0d0d),
                      //               ),
                      //             ),
                      //             Text("GOALS"),
                      //             Text(
                      //               jsonData.score2,
                      //               textAlign: TextAlign.justify,
                      //               style: const TextStyle(
                      //                 color: Color(0xFF0d0d0d),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //         Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text(
                      //               jsonData.score1,
                      //               textAlign: TextAlign.justify,
                      //               style: const TextStyle(
                      //                 color: Color(0xFF0d0d0d),
                      //               ),
                      //             ),
                      //             Text("SHOOTS [ON TARGET]"),
                      //             Text(
                      //               jsonData.score2,
                      //               textAlign: TextAlign.justify,
                      //               style: const TextStyle(
                      //                 color: Color(0xFF0d0d0d),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //         Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text(
                      //               jsonData.shoot1,
                      //               textAlign: TextAlign.justify,
                      //               style: const TextStyle(
                      //                 color: Color(0xFF0d0d0d),
                      //               ),
                      //             ),
                      //             Text("PASSES"),
                      //             Text(
                      //               jsonData.shoot2,
                      //               textAlign: TextAlign.justify,
                      //               style: const TextStyle(
                      //                 color: Color(0xFF0d0d0d),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      // Row(
                      //   mainAxisAlignment:
                      //       MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       jsonData.accuracy1,
                      //       textAlign: TextAlign.justify,
                      //       style: const TextStyle(
                      //         color: Color(0xFF0d0d0d),
                      //       ),
                      //     ),
                      //     Text("PASS ACCURACY"),
                      //     Text(
                      //       jsonData.accuracy2,
                      //       textAlign: TextAlign.justify,
                      //       style: const TextStyle(
                      //         color: Color(0xFF0d0d0d),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisAlignment:
                      //       MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       jsonData.possesion1,
                      //       textAlign: TextAlign.justify,
                      //       style: const TextStyle(
                      //         color: Color(0xFF0d0d0d),
                      //       ),
                      //     ),
                      //     Text("BALL POSSESION"),
                      //     Text(
                      //       jsonData.possesion2,
                      //       textAlign: TextAlign.justify,
                      //       style: const TextStyle(
                      //         color: Color(0xFF0d0d0d),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  );
                }).toList(),
              ),
      ),
    );
  }
}
