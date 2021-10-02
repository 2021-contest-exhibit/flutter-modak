import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modak/component/RecommandCampingWidget.dart';
import 'package:modak/component/TodayCampingWidget.dart';
import 'package:modak/dto/Camping.dart';

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
                            fontWeight: FontWeight.bold,
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
                            fontWeight: FontWeight.bold,
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
                        Camping(title: "백운계곡캠핑장", discription: "글램핑과 캠핑을 골라 즐길 수 있는 백운계곡캠핑..."),
                        Camping(title: "백운계곡캠핑장", discription: "글램핑과 캠핑을 골라 즐길 수 있는 백운계곡캠핑..."),
                        Camping(title: "백운계곡캠핑장", discription: "글램핑과 캠핑을 골라 즐길 수 있는 백운계곡캠핑..."),
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
                            fontWeight: FontWeight.bold,
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
                            Camping(title: "김삿갓 계곡 캠핑장", discription: "#봄#여름#가을#겨울#친절한#여유있는#깨끗한#온수 잘 나오는"),
                            Camping(title: "김삿갓 계곡 캠핑장", discription: "#봄#여름#가을#겨울#친절한#여유있는#깨끗한#온수 잘 나오는"),
                            Camping(title: "김삿갓 계곡 캠핑장", discription: "#봄#여름#가을#겨울#친절한#여유있는#깨끗한#온수 잘 나오는"),
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
