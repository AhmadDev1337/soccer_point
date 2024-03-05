// ignore_for_file: unused_field, prefer_final_fields, prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'home_page.dart';
import 'match_stats.dart';

class BarController extends StatefulWidget {
  const BarController({super.key});

  @override
  State<BarController> createState() => _BarControllerState();
}

class _BarControllerState extends State<BarController> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              HomePage(),
              StatisticsPage(),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 50,
            right: 50,
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/home-1-svgrepo-com.svg",
                            width: 20,
                            color: _currentPageIndex == 0
                                ? Color(0xff1e90ff)
                                : Colors.grey,
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              color: _currentPageIndex == 0
                                  ? Color(0xff1e90ff)
                                  : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/icons/candle.png",
                            width: 20,
                            color: _currentPageIndex == 1
                                ? Color(0xff1e90ff)
                                : Colors.grey,
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              color: _currentPageIndex == 1
                                  ? Color(0xff1e90ff)
                                  : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
