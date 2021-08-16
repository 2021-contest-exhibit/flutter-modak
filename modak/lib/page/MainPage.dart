import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modak/component/BottomNavigationWidget.dart';
import 'package:modak/page/DashBoardPage.dart';

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
