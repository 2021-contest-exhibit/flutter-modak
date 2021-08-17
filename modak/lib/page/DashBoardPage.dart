import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modak/DTO/Camping.dart';
import 'package:modak/component/RecommandCampingWidget.dart';
import 'package:modak/component/TodayCampingWidget.dart';

class DashBoardPage extends StatefulWidget {
  @override
  DashBoardPageState createState() => DashBoardPageState();
}

class DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    final double _statusBarHeight = MediaQuery.of(context).padding.top;
    final double _height = MediaQuery.of(context).size.height;
    final double _titleHeight = 48.0;
    final double _contentHeight = _height - _statusBarHeight - _titleHeight;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: _titleHeight,
              margin:
                  EdgeInsets.only(top: _statusBarHeight, left: 4.0, right: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.menu),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
            Container(
              height: _contentHeight,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 36,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'Modak',
                          style: TextStyle(
                            fontSize: 48,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          '오늘의 캠핑 추천',
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TodayCompingWidget(
                      recipeList: [
                        Camping('test'),
                        Camping('test'),
                        Camping('test'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          '나만의 캠핑 추천',
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RecommandCampingWidget(
                          campingList: [
                            Camping("test"),
                            Camping("test"),
                            Camping("test"),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
