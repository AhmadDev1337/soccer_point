// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'items saudi pro league/classement.dart';
import 'items saudi pro league/timetable.dart';
import 'items saudi pro league/top_score.dart';

class SaudiProLeaguePage extends StatefulWidget {
  const SaudiProLeaguePage({super.key});

  @override
  State<SaudiProLeaguePage> createState() => _SaudiProLeaguePageState();
}

class _SaudiProLeaguePageState extends State<SaudiProLeaguePage> {
  int currentPageIndex = 0;
  InterstitialAd? _interstitialAd;

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

  @override
  void initState() {
    super.initState();
    _loadInterstitialAd6();
  }

  final List<String> items = [
    "Timetable",
    "Classement",
    "Top Score",
  ];

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
                  _loadInterstitialAd6();
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
                  "2023 - 24",
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
                  Image.network(
                    "https://res.cloudinary.com/dybvjvrib/image/upload/v1709234560/Soccer%20Point/League/asl_mhzcg7.png",
                    width: 70,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Saudi Pro League",
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
                          Image.network(
                            "https://res.cloudinary.com/dybvjvrib/image/upload/v1709657217/Soccer%20Point/International%20League/20240305_234532_cehzhr.png",
                            width: 15,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Saudi Arabia",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 1, 6, 34),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: currentPageIndex == index
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              items[index],
                              style: TextStyle(
                                  color: currentPageIndex == index
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: PageView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: items.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentPageIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return buildItemPage(items[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItemPage(String item) {
    Widget content;
    if (item == "Timetable") {
      content = StatisticPage();
    } else if (item == "Classement") {
      content = ClassementPage();
    } else {
      content = TopScorePage();
    }

    return ListView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      children: [
        content,
      ],
    );
  }
}
