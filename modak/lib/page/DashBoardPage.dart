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
    final double _titleHeight = 56.0;
    final double _contentHeight = _height - _statusBarHeight - _titleHeight;
    return Scaffold(
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              height: _titleHeight,
              margin:
                  EdgeInsets.only(top: _statusBarHeight, left: 4.0, right: 4.0),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          widget.pageController.jumpToPage(2);
                        },
                        icon: const Icon(Icons.search, size: 28,),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      child: Column(
                        children: [
                          Image.asset(
                            'image/logo_black.png',
                            width: 24.0,
                            height: 24.0,
                          ),
                          Text(
                            'MODAK',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: '비트로_코어_TTF'
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    'NEW & HOT',
                    style: TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: '비트로_코어_TTF'),
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
                    return TodayCompingWidget(
                        campingList: [...state.campings]);
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
                    '추천 캠핑',
                    style: TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: '비트로_코어_TTF'),
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
                          campingList: ResponseGetCampings(
                              content: [...state.campings]),
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
    );
  }

  @override
  void initState() {
    BlocProvider.of<CampingAPIBloc>(context).add(GetTodayCampingsEvent());
  }
}
