import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/CampingAPIBloc.dart';
import 'package:modak/bloc/CampingAPIEvent.dart';
import 'package:modak/bloc/CampingAPIState.dart';
import 'package:modak/bloc/ModakBloc.dart';
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
  List<Content> hotCampings = [];
  bool isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    final double _statusBarHeight = MediaQuery.of(context).padding.top;
    final double _height = MediaQuery.of(context).size.height;
    final double _titleHeight = 56.0;
    final double _contentHeight = _height - _statusBarHeight - _titleHeight;
    return Scaffold(
      body: Container(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.maxScrollExtent-20 < notification.metrics.pixels) {
              print('reload ${((hotCampings.length > 0)?hotCampings.length~/15:0)}');
              if (!isLoading) {
                isLoading = true;
                BlocProvider.of<CampingAPIBloc>(context).add(GetTodayCampingsEvent(index: ((hotCampings.length > 0)?hotCampings.length~/5:0)));
              }
            }
            return true;
          },
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
                          icon: const Icon(
                            Icons.search,
                            size: 28,
                          ),
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
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'NotoSansKR'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.0,),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 18, 32, 47),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0))
                ),
                child: Column(
                  children: [
                    SizedBox(height: 12,),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Text(
                            'AI 추천',
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'NotoSansKR'),
                          )
                        ],
                      ),
                    ),
                    Container(
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
                      height: 12,
                    ),
                    Container(
                        padding: EdgeInsets.only(top:24, ),
                        decoration: BoxDecoration(
                          color: Color(0xffF2F2F2),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),

                          boxShadow: [
                            BoxShadow(
                                color: Color(0x22000000),
                                offset: Offset(-10, -10),
                                spreadRadius: 0,
                                blurRadius: 10),
                            BoxShadow(
                                color: Color(0x11000000),
                                offset: Offset(10, 10),
                                spreadRadius: 0,
                                blurRadius: 10)
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                    'HOT & TREND',
                                    style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'NotoSansKR'),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                    '여긴 어때요?',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'NotoSansKR'),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  BlocBuilder<CampingAPIBloc, CampingAPIState>(
                                    builder: (context, state) {
                                      if (state is TodayCampingsLoaded) {
                                        isLoading = false;
                                        hotCampings.addAll(state.campings);
                                        print('campings: ${state.campings[0].name}');
                                        return RecommandCampingWidget(
                                          campingList:
                                          ResponseGetCampings(content: [...hotCampings]),
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
                            Visibility(child: CircularProgressIndicator(), visible: isLoading,),
                            SizedBox(
                              height: 120,
                            )
                          ],
                        )
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<CampingAPIBloc>(context).add(
        GetTodayCampingsEvent(index: 0)
    );
  }
}
