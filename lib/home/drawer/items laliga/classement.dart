// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class Matchs {
  final String image;
  final String club;
  final String win;
  final String draw;
  final String lose;
  final String points;

  Matchs({
    required this.image,
    required this.club,
    required this.win,
    required this.draw,
    required this.lose,
    required this.points,
  });
}

class ClassementPage extends StatefulWidget {
  const ClassementPage({super.key});

  @override
  State<ClassementPage> createState() => _ClassementPageState();
}

class _ClassementPageState extends State<ClassementPage> {
  List<Matchs> matchsList = [];
  bool isLoading = true;

  Future<void> match() async {
    const singleJsonUrl = "https://pastebin.com/raw/zgEYXPC4";

    try {
      final response = await http.get(Uri.parse(singleJsonUrl));
      if (response.statusCode == 200) {
        final matchs = json.decode(response.body);
        matchsList = matchs.map<Matchs>((data) {
          return Matchs(
            image: data['image'],
            club: data['club'],
            win: data['win'],
            draw: data['draw'],
            lose: data['lose'],
            points: data['points'],
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
        ? Center(
            child: SpinKitWave(
              color: Color(0xff1e90ff),
              size: 25,
            ),
          )
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Club",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "W",
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                "D",
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                "L",
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 30),
                        Text(
                          "Points",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Column(
                children: matchsList.map((matchs) {
                  return Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 5, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(matchs.image, width: 20),
                            SizedBox(width: 10),
                            Text(
                              matchs.club,
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  matchs.win,
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 28,
                                ),
                                Text(
                                  matchs.draw,
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 28,
                                ),
                                Text(
                                  matchs.lose,
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(width: 38),
                            Text(
                              matchs.points,
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          );
    // Column(
    //     children: [
    //       Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 15),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Column(
    //               children: [
    //                 Text(
    //                   "Club",
    //                   style: TextStyle(fontSize: 13, color: Colors.grey),
    //                 ),
    //                 SizedBox(height: 15),
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: matchsList.map((matchs) {
    //                     return Padding(
    //                       padding: EdgeInsets.only(bottom: 10),
    //                       child: Row(
    //                         children: [
    //                           Image.network(matchs.image, width: 20),
    //                           SizedBox(width: 10),
    //                           Text(
    //                             matchs.club,
    //                             style: TextStyle(
    //                                 fontSize: 11, color: Colors.grey),
    //                           ),
    //                         ],
    //                       ),
    //                     );
    //                   }).toList(),
    //                 ),
    //               ],
    //             ),
    //             Row(
    //               crossAxisAlignment: CrossAxisAlignment.end,
    //               children: [
    //                 Column(
    //                   children: [
    //                     Text(
    //                       "W",
    //                       style:
    //                           TextStyle(fontSize: 13, color: Colors.grey),
    //                     ),
    //                     SizedBox(height: 15),
    //                     Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: matchsList.map((matchs) {
    //                         return Padding(
    //                           padding: EdgeInsets.only(bottom: 10),
    //                           child: Text(
    //                             matchs.win,
    //                             style: TextStyle(
    //                                 fontSize: 11, color: Colors.grey),
    //                           ),
    //                         );
    //                       }).toList(),
    //                     ),
    //                   ],
    //                 ),
    //                 SizedBox(width: 25),
    //                 Column(
    //                   children: [
    //                     Text(
    //                       "D",
    //                       style:
    //                           TextStyle(fontSize: 13, color: Colors.grey),
    //                     ),
    //                     SizedBox(height: 15),
    //                     Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: matchsList.map((matchs) {
    //                         return Padding(
    //                           padding: EdgeInsets.only(bottom: 10),
    //                           child: Text(
    //                             matchs.draw,
    //                             style: TextStyle(
    //                                 fontSize: 11, color: Colors.grey),
    //                           ),
    //                         );
    //                       }).toList(),
    //                     ),
    //                   ],
    //                 ),
    //                 SizedBox(width: 25),
    //                 Column(
    //                   children: [
    //                     Text(
    //                       "L",
    //                       style:
    //                           TextStyle(fontSize: 13, color: Colors.grey),
    //                     ),
    //                     SizedBox(height: 15),
    //                     Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: matchsList.map((matchs) {
    //                         return Padding(
    //                           padding: EdgeInsets.only(bottom: 10),
    //                           child: Text(
    //                             matchs.lose,
    //                             style: TextStyle(
    //                                 fontSize: 11, color: Colors.grey),
    //                           ),
    //                         );
    //                       }).toList(),
    //                     ),
    //                   ],
    //                 ),
    //                 SizedBox(width: 30),
    //                 Column(
    //                   children: [
    //                     Text(
    //                       "Points",
    //                       style:
    //                           TextStyle(fontSize: 13, color: Colors.grey),
    //                     ),
    //                     SizedBox(height: 15),
    //                     Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: matchsList.map((matchs) {
    //                         return Padding(
    //                           padding: EdgeInsets.only(bottom: 10),
    //                           child: Text(
    //                             matchs.points,
    //                             style: TextStyle(
    //                                 fontSize: 11, color: Colors.grey),
    //                           ),
    //                         );
    //                       }).toList(),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   );
  }
}
