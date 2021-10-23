import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/CampingAPIBloc.dart';
import 'package:modak/bloc/CampingAPIEvent.dart';
import 'package:modak/bloc/CampingAPIState.dart';
import 'package:modak/component/RecommandCampingWidget.dart';
import 'package:modak/component/TodayCampingWidget.dart';
import 'package:modak/dto/Camping.dart';
import 'package:modak/rest/Content.dart';
import 'package:modak/rest/ResponseGetCampings.dart';

class DashBoardPage extends StatefulWidget {
  final PageController pageController;

  DashBoardPage({required this.pageController});

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
                    },
                    icon: const Icon(Icons.menu),
                  ),
                  IconButton(
                    onPressed: () {
                      widget.pageController.jumpToPage(2);
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
                    child: BlocBuilder<CampingAPIBloc, CampingAPIState>(
                      builder: (context, state) {
                        if (state is TodayCampingsLoaded) {
                          return TodayCompingWidget(campingList: [...state.campings]);
                        }
                        return Container();
                      },
                      buildWhen: (previous, current) {
                        if (current is TodayCampingsLoaded) {
                          return true;
                        } else {
                          return false;
                        }
                      },
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
                        BlocBuilder<CampingAPIBloc, CampingAPIState>(
                          builder: (context, state) {
                            if (state is TodayCampingsLoaded) {
                              return RecommandCampingWidget(
                                campingList: ResponseGetCampings(content: [...state.campings]),
                              );
                            }
                            return Container();
                          },
                          buildWhen: (previous, current) {
                            if (current is TodayCampingsLoaded) {
                              print("reload");
                              return true;
                            } else {
                              return false;
                            }
                          },
                        ),
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

  @override
  void initState() {
    BlocProvider.of<CampingAPIBloc>(context).add(
        GetTodayCampingsEvent()
    );
  }
}
