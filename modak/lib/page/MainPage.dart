import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modak/component/BottomNavigationWidget.dart';
import 'package:modak/page/DashBoardPage.dart';
import 'package:modak/page/MapPage.dart';
import 'package:modak/page/SettingPage.dart';

class MainPage extends StatefulWidget {
  final PageController pageController = PageController(initialPage: 0);

  @override
  State createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              DashBoardPage(),
              MapPage(),
              SettingPage(),
            ],
          ),
          Positioned(
            bottom: 0,
            child: BottomNavigationWidget(),
          )
        ],
      ),
    );
  }
}
