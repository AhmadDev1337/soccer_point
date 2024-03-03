// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, unused_field, avoid_unnecessary_containers

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;

import 'drawer/premier_league.dart';

class LiveMatch {
  final String image;
  final String league;
  final String week;
  final String image1;
  final String team1;
  final String image2;
  final String team2;
  final String score;

  LiveMatch({
    required this.image,
    required this.league,
    required this.week,
    required this.image1,
    required this.team1,
    required this.image2,
    required this.team2,
    required this.score,
  });
}

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<LiveMatch> liveMatchList = [];
  List<Matchs> matchsList = [];
  bool isLoading = true;
  InterstitialAd? _interstitialAd;

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-8363980854824352/2854697735',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _interstitialAd!.show();
          log('Ad onAdLoaded');
        },
        onAdFailedToLoad: (LoadAdError error) {
          log('Interstitial ad failed to load: $error');
        },
      ),
    );
  }

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      shadowColor: Colors.grey,
      width: MediaQuery.of(context).size.width * 0.7,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 1, 6, 34),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/laliga.png",
                  width: 30,
                ),
                SizedBox(width: 10),
                Text('La Liga'),
              ],
            ),
            onTap: () {
              // Action when Menu 1 is tapped
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/images-removebg-preview (1).png",
                  width: 30,
                ),
                SizedBox(width: 10),
                Text('Premier League'),
              ],
            ),
            onTap: () {
              _loadInterstitialAd();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PremierLeaguePage()));
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/bundesliga.png",
                  width: 30,
                ),
                SizedBox(width: 10),
                Text('Bundesliga'),
              ],
            ),
            onTap: () {
              // Action when Menu 1 is tapped
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/asl.png",
                  width: 30,
                ),
                SizedBox(width: 10),
                Text('UCL'),
              ],
            ),
            onTap: () {
              // Action when Menu 1 is tapped
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/asl.png",
                  width: 30,
                ),
                SizedBox(width: 10),
                Text('Arab Saudi League'),
              ],
            ),
            onTap: () {
              // Action when Menu 1 is tapped
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    liveMatch();
    match();
    _loadInterstitialAd();
  }

  Future<void> liveMatch() async {
    const singleJsonUrl = 'https://pastebin.com/raw/PitcFuGK';

    try {
      final response = await http.get(Uri.parse(singleJsonUrl));
      if (response.statusCode == 200) {
        final liveMatch = json.decode(response.body);
        liveMatchList = liveMatch.map<LiveMatch>((data) {
          return LiveMatch(
            image: data['image'],
            league: data['league'],
            week: data['week'],
            image1: data['image1'],
            team1: data['team1'],
            image2: data['image2'],
            team2: data['team2'],
            score: data['score'],
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

  Future<void> match() async {
    const singleJsonUrl = 'https://pastebin.com/raw/xaZxCKiG';

    try {
      final response = await http.get(Uri.parse(singleJsonUrl));
      if (response.statusCode == 200) {
        final matchs = json.decode(response.body);
        matchsList = matchs.map<Matchs>((data) {
          return Matchs(
            week: data['week'],
            image1: data['image1'],
            team1: data['team1'],
            image2: data['image2'],
            team2: data['team2'],
            date: data['date'],
            time: data['time'],
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
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Soccer Point",
      home: Scaffold(
        appBar: AppBar(
          key: _scaffoldKey,
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 1, 6, 34),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/icons/logo nama.png",
                width: 100,
                color: Colors.grey,
              ),
              Image.asset(
                "assets/icons/red flag.png",
                width: 30,
              ),
            ],
          ),
        ),
        drawer: buildDrawer(context),
        backgroundColor: Color.fromARGB(255, 1, 6, 34),
        body: isLoading
            ? Center(
                child: SpinKitWave(
                  color: Color(0xff1e90ff),
                  size: 25,
                ),
              )
            : ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
                    child: Text(
                      "Live Match",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: liveMatchList.map((liveMatch) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 170,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  liveMatch.image,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Positioned(
                                right: 50,
                                left: 50,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Text(
                                        liveMatch.league,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        liveMatch.week,
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 5,
                                right: 5,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Image.network(
                                            liveMatch.image1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            liveMatch.team1,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        liveMatch.score,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Column(
                                        children: [
                                          Image.network(
                                            liveMatch.image2,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            liveMatch.team2,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
                            color: Colors.grey,
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "...",
                          style: TextStyle(
                            color: Color(0xff1e90ff),
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
                      children: matchsList.map((matchs) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 80,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 1, 6, 34),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(4.0, 4.0),
                                blurRadius: 15.0,
                                spreadRadius: 1.0,
                                color: Colors.grey.shade800,
                              ),
                              BoxShadow(
                                offset: Offset(-4.0, -4.0),
                                blurRadius: 15.0,
                                spreadRadius: 1.0,
                                color: Color.fromARGB(255, 1, 6, 34),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    matchs.team1,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Image.network(
                                    matchs.image1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    matchs.time,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    matchs.date,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.network(
                                    matchs.image2,
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    matchs.team2,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
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
