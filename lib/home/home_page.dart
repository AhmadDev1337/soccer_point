// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, unused_field

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> leagues = [
    {
      "image": "assets/images/laliga.png",
      "league": "La Liga",
      "week": "Week 10",
      "image1": "assets/images/images-removebg-preview (2).png",
      "team1": "Real Madrid",
      "image2": "assets/images/barcelona.png",
      "team2": "Barcelona",
      "score": "4 : 1",
      "color": 0xFFf72b91,
    },
    {
      "image": "assets/images/images-removebg-preview (1).png",
      "league": "Premier League",
      "week": "Week 11",
      "image1": "assets/images/mc.png",
      "team1": "Man City",
      "image2": "assets/images/mu.png",
      "team2": "Man United",
      "score": "4 : 1",
      "color": 0xFF3f51b5,
    },
    {
      "image": "assets/images/seriea.png",
      "league": "Serie A",
      "week": "Week 10",
      "image1": "assets/images/mc.png",
      "team1": "Man City",
      "image2": "assets/images/mu.png",
      "team2": "Man United",
      "score": "4 : 1",
      "color": 0xFF4caf50,
    },
    {
      "image": "assets/images/seriea.png",
      "league": "La Liga",
      "week": "Week 10",
      "image1": "assets/images/mc.png",
      "team1": "Man City",
      "image2": "assets/images/mu.png",
      "team2": "Man City",
      "score": "4 : 1",
      "color": 0xFFff9800,
    },
  ];

  List<Map<String, dynamic>> matchs = [
    {
      "image1": "assets/images/mc.png",
      "name1": "Man City",
      "image2": "assets/images/mu.png",
      "name2": "Man United",
      "date": "10 Oct",
      "time": "06:00",
    },
    {
      "image1": "assets/images/mc.png",
      "name1": "Man City",
      "image2": "assets/images/mu.png",
      "name2": "Man United",
      "date": "10 Oct",
      "time": "06:00",
    },
    {
      "image1": "assets/images/mc.png",
      "name1": "Man City",
      "image2": "assets/images/mu.png",
      "name2": "Man United",
      "date": "10 Oct",
      "time": "06:00",
    },
    {
      "image1": "assets/images/mc.png",
      "name1": "Man City",
      "image2": "assets/images/mu.png",
      "name2": "Man United",
      "date": "10 Oct",
      "time": "06:00",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Soccer Point",
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/icons/red flag.png",
                width: 30,
              ),
              Image.asset(
                "assets/icons/logo nama.png",
                width: 100,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Color(0xfff2f2f2),
                  ),
                  child: Icon(Icons.notifications, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
              child: Text(
                "Live Match",
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                ),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: leagues.map((league) {
                  return Container(
                    width: 230,
                    height: MediaQuery.of(context).size.height * 0.2,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(league["color"]),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -30,
                          top: -20,
                          bottom: -20,
                          child: Image.asset(
                            league["image"],
                          ),
                        ),
                        Positioned(
                          right: 50,
                          left: 50,
                          child: Column(
                            children: [
                              Text(
                                league["league"],
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 5),
                              Text(
                                league["week"],
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 5,
                          right: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    league["image1"],
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    league["team1"],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Text(
                                league["score"],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                    fontWeight: FontWeight.w800),
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    league["image2"],
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    league["team2"],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Matchs",
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "see all",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: matchs.map((match) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 80,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                          color: Colors.grey.shade500,
                        ),
                        BoxShadow(
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text(
                              match["name1"],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              match['image1'],
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              match["time"],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              match["date"],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              match['image2'],
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              match["name2"],
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
