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
                    child: BlocBuilder<CampingAPIBloc, CampingAPIState>(
                      builder: (context, state) {
                        if (state is TodayCampingsLoaded) {
                          print("state: ${state.campings[0].name}");
                          return TodayCompingWidget(campingList: [...state.campings]);
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
                          campingList: ResponseGetCampings(content: [Content.fromJson({
                            "contentId": 3,
                            "name": "(주)데일리랜드",
                            "viewCount": 0,
                            "addr": "강원 춘천시 동산면 윗성골길 36\t",
                            "phoneNumber": "",
                            "type": "자동차야영장",
                            "operationSeasons": "봄,여름,가을",
                            "operationDays": "평일+주말",
                            "reservationWay": "온라인실시간예약",
                            "nearbyFacilitiesAvailable": "",
                            "facilities": "전기,무선인터넷,장작판매,온수,물놀이장,마트.편의점",
                            "longitude": "127.845655",
                            "latitude": "37.7584857",
                            "operationType": "민간",
                            "environments": [
                              {
                                "id": 11,
                                "name": "산"
                              },
                              {
                                "id": 12,
                                "name": "숲"
                              }
                            ],
                            "campingImages": [
                              {
                                "id": 1,
                                "serialnum": "73241",
                                "modifiedtime": "2021-02-18 17:08:27",
                                "imageUrl": "https://gocamping.or.kr/upload/camp/3/1564sPF0r8iaRUY0czIIfPbU.jpg"
                              },
                              {
                                "id": 2,
                                "serialnum": "73242",
                                "modifiedtime": "2021-02-18 17:08:27",
                                "imageUrl": "https://gocamping.or.kr/upload/camp/3/708442rBFwS03LPGVZDPBkKq.jpg"
                              },
                              {
                                "id": 3,
                                "serialnum": "73243",
                                "modifiedtime": "2021-02-18 17:08:27",
                                "imageUrl": "https://gocamping.or.kr/upload/camp/3/6791ufBTEV41l7kb7jgUuvkF.jpg"
                              },
                              {
                                "id": 4,
                                "serialnum": "73244",
                                "modifiedtime": "2021-02-18 17:08:27",
                                "imageUrl": "https://gocamping.or.kr/upload/camp/3/1375PZXVu96W0fwfHkXakIRw.jpg"
                              },
                              {
                                "id": 5,
                                "serialnum": "73245",
                                "modifiedtime": "2021-02-18 17:08:27",
                                "imageUrl": "https://gocamping.or.kr/upload/camp/3/7272O0aoixJTF4WgTsdHeTL9.jpg"
                              },
                              {
                                "id": 6,
                                "serialnum": "73246",
                                "modifiedtime": "2021-02-18 17:08:27",
                                "imageUrl": "https://gocamping.or.kr/upload/camp/3/8844cWfyDrkNVCcTHYBZg7YF.jpg"
                              },
                              {
                                "id": 7,
                                "serialnum": "73247",
                                "modifiedtime": "2021-02-18 17:08:27",
                                "imageUrl": "https://gocamping.or.kr/upload/camp/3/0846MqRKEgSxpgVbUWajFyPG.jpg"
                              },
                              {
                                "id": 8,
                                "serialnum": "73248",
                                "modifiedtime": "2021-02-18 17:08:27",
                                "imageUrl": "https://gocamping.or.kr/upload/camp/3/9793Hxv0t4gp9xerRmglGqv1.jpg"
                              },
                              {
                                "id": 9,
                                "serialnum": "73249",
                                "modifiedtime": "2021-02-18 17:08:27",
                                "imageUrl": "https://gocamping.or.kr/upload/camp/3/3283SUdVlBtsaWEPfTGo9AMr.jpg"
                              },
                              {
                                "id": 10,
                                "serialnum": "73250",
                                "modifiedtime": "2021-02-18 17:08:27",
                                "imageUrl": "https://gocamping.or.kr/upload/camp/3/0383skBrThi4qQ3x95iXH7Mv.jpg"
                              }
                            ]
                          })]),
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

  @override
  void initState() {
    BlocProvider.of<CampingAPIBloc>(context).add(
        GetTodayCampingsEvent()
    );
  }
}
