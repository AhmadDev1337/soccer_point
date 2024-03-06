// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, unused_field, avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;

import 'drawer/asean cup.dart';
import 'drawer/asian_cup.dart';
import 'drawer/bundesliga.dart';
import 'drawer/euro.dart';
import 'drawer/laliga.dart';
import 'drawer/premier_league.dart';
import 'drawer/saudi_pro_league.dart';
import 'drawer/serie_a.dart';
import 'drawer/ucl.dart';
import 'drawer/world_cup.dart';

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

  void _loadInterstitialAd1() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-8363980854824352/1855426932',
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

  void _loadInterstitialAd2() {
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

  void _loadInterstitialAd3() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-8363980854824352/1663855240',
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

  void _loadInterstitialAd4() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-8363980854824352/1173487389',
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

  void _loadInterstitialAd5() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-8363980854824352/6581726738',
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

  void _loadInterstitialAd6() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-8363980854824352/8860405719',
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

  void _loadInterstitialAd7() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-8363980854824352/6390155049',
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

  void _loadInterstitialAd8() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-8363980854824352/7244071711',
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

  void _loadInterstitialAd9() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-8363980854824352/4098446892',
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

  void _loadInterstitialAd10() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-8363980854824352/6234242374',
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

  @override
  void initState() {
    super.initState();
    liveMatch();
    match();
    _loadInterstitialAd1();
    _loadInterstitialAd2();
    _loadInterstitialAd3();
    _loadInterstitialAd4();
    _loadInterstitialAd5();
    _loadInterstitialAd6();
    _loadInterstitialAd7();
    _loadInterstitialAd8();
    _loadInterstitialAd9();
    _loadInterstitialAd10();
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
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  "assets/images/images (1).jpeg",
                  fit: BoxFit.fill,
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color.fromARGB(255, 1, 6, 34),
                        Color.fromARGB(255, 1, 6, 34).withOpacity(0.6),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Soccer Point",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/laliga.png",
                  width: 30,
                  color: Color.fromARGB(255, 1, 6, 34),
                ),
                SizedBox(width: 10),
                Text('Laliga'),
              ],
            ),
            onTap: () {
              _loadInterstitialAd1();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LaligaPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/images-removebg-preview (1).png",
                  width: 30,
                  color: Color.fromARGB(255, 1, 6, 34),
                ),
                SizedBox(width: 10),
                Text('Premier League'),
              ],
            ),
            onTap: () {
              _loadInterstitialAd2();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PremierLeaguePage(),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/serie a.png",
                  color: Color.fromARGB(255, 1, 6, 34),
                  width: 30,
                ),
                SizedBox(width: 10),
                Text('Serie A'),
              ],
            ),
            onTap: () {
              _loadInterstitialAd3();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SerieAPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/bundesliga.png",
                  width: 30,
                  color: Color.fromARGB(255, 1, 6, 34),
                ),
                SizedBox(width: 10),
                Text('Bundesliga'),
              ],
            ),
            onTap: () {
              _loadInterstitialAd4();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BundesligaPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/ucl.png",
                  width: 30,
                  color: Color.fromARGB(255, 1, 6, 34),
                ),
                SizedBox(width: 10),
                Text('UCL'),
              ],
            ),
            onTap: () {
              _loadInterstitialAd5();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UclPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/asl.png",
                  width: 30,
                  color: Color.fromARGB(255, 1, 6, 34),
                ),
                SizedBox(width: 10),
                Text('Saudi Pro League'),
              ],
            ),
            onTap: () {
              _loadInterstitialAd6();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SaudiProLeaguePage(),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/euro cup.png",
                  width: 30,
                  color: Color.fromARGB(255, 1, 6, 34),
                ),
                SizedBox(width: 10),
                Text('EURO'),
              ],
            ),
            onTap: () {
              _loadInterstitialAd7();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EuroPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/world cup.png",
                  width: 30,
                  color: Color.fromARGB(255, 1, 6, 34),
                ),
                SizedBox(width: 10),
                Text('WORLD Cup'),
              ],
            ),
            onTap: () {
              _loadInterstitialAd8();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WorldCupPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/asean cup.png",
                  width: 30,
                  color: Color.fromARGB(255, 1, 6, 34),
                ),
                SizedBox(width: 10),
                Text('ASEAN Cup'),
              ],
            ),
            onTap: () {
              _loadInterstitialAd9();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AseanCupPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/asian cup.png",
                  width: 30,
                  color: Color.fromARGB(255, 1, 6, 34),
                ),
                SizedBox(width: 10),
                Text('ASIAN Cup'),
              ],
            ),
            onTap: () {
              _loadInterstitialAd10();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AsianCupPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
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
