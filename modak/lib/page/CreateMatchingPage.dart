import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/ModakBloc.dart';
import 'package:modak/bloc/ModakEvent.dart';
import 'package:modak/bloc/ModakState.dart';
import 'package:modak/component/RecommandCampingWidget.dart';
import 'package:modak/dto/Matching.dart';
import 'package:modak/rest/Content.dart';
import 'package:modak/rest/ResponseGetCampings.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MaterialApp(
    home: CreateMatchingPage(),
  ));
}

class CreateMatchingPage extends StatefulWidget {
  @override
  CreateMatchingPageState createState() => CreateMatchingPageState();
}

class CreateMatchingPageState extends State<CreateMatchingPage> {
  late DateTime? _selectedStartDay = DateTime.now();
  late DateTime? _selectedEndDay = DateTime.now();

  String getDate() {
    return "${(_selectedStartDay??DateTime.now()).year}.${(_selectedStartDay??DateTime.now()).month}.${(_selectedStartDay??DateTime.now()).day} ~ ${(_selectedEndDay??DateTime.now()).year}.${(_selectedEndDay??DateTime.now()).month}.${(_selectedEndDay??DateTime.now()).day}";
  }
  @override
  Widget build(BuildContext context) {
    final statusHeight = MediaQuery.of(context).padding.top;
    final selectedCamping = Content.fromJson({
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
    });
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: statusHeight, left: 20.0, right: 20.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 36.0,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              "장소",
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 18.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.white;
                }),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.white;
                }),
              ),
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
            RecommandCampingWidget(campingList: ResponseGetCampings(content: [selectedCamping]),),
            SizedBox(
              height: 36.0,
            ),
            Text(
              "날짜",
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            ),
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              rangeStartDay: _selectedStartDay,
              rangeEndDay: _selectedEndDay,
              availableGestures: AvailableGestures.none,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
              ),
              onRangeSelected: (start, end, focusedDay) {
                setState(() {
                  _selectedStartDay = start;
                  _selectedEndDay = end;
                });
              },
              rangeSelectionMode: RangeSelectionMode.enforced,
            ),
            SizedBox(height: 24.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  child: Text(getDate(), style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x22000000),
                        offset: Offset(2.0, 2.0),
                        blurRadius: 2.0,
                        spreadRadius: 0.1,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 36.0,),
            OutlinedButton(
              onPressed: () async {
                BlocProvider.of<ModakBloc>(context).add(
                  CreateMatchingEvent(createDate: DateTime.now(), startDate: _selectedStartDay!, endDate: _selectedEndDay!, campingId: selectedCamping.contentId)
                );
                await BlocProvider.of<ModakBloc>(context).stream.map((state) {
                  if (state is Empty) {
                  }else if (state is Loading){
                    print("loading");
                  }else if (state is Error) {
                    print("error");
                  }else if (state is Loaded) {
                    Navigator.pop(context);
                  }
                }).last;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "매칭하기",
                    style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.resolveWith((states) {
                  return Size(double.infinity, 48.0);
                }),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return Theme.of(context).primaryColor;
                }),
                foregroundColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.white;
                }),
              ),
            ),
            SizedBox(height: 100.0,),
          ],
        ),
      ),
    );
  }
}
