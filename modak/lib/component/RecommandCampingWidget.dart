import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modak/dto/Camping.dart';
import 'package:modak/rest/Content.dart';
import 'package:modak/rest/ResponseGetCampings.dart';

class RecommandCampingWidget extends StatefulWidget {
  ResponseGetCampings campingList;

  RecommandCampingWidget({required this.campingList});

  @override
  RecommandCampingWidgetState createState() => RecommandCampingWidgetState();
}

class RecommandCampingWidgetState extends State<RecommandCampingWidget> {
  Widget _campingItemWidget(Content camping) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 18.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/camping_detail', arguments: Content.fromJson({
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
          }));
        },
        child: Ink(
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x22000000),
                  offset: Offset(2.0, 2.0),
                  blurRadius: 2.0,
                  spreadRadius: 0.1,
                ),
              ]
          ),
          child: Row(
            children: [
              Container(
                width: (_width-40) * 45/100,
                height: 150.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), bottomLeft: Radius.circular(5.0)),
                  child: (camping.campingImages != null && camping.campingImages!.length > 0) ? Image.network(
                    camping.campingImages![0].imageUrl,
                    fit: BoxFit.fitHeight,
                  ) : Center(child: Image.asset('image/logo_black.png',width: 48.0, height: 48.0,)),
                ),
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                width: (_width-40) * 55/100,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0,),
                    Text(
                      camping.name!,
                      style: const TextStyle(
                        color: const Color(0xff000000),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Flexible(
                      child: Text(
                        camping.addr!,
                        maxLines: 2,
                        style: const TextStyle(
                          color: const Color(0xff8f8f8f),
                          fontSize: 8.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.favorite, color: Colors.red, size: 18.0,),
                        const SizedBox(width: 2.0,),
                        Text(
                          "${camping.viewCount!}"
                        )
                      ],
                    )
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
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: widget.campingList.content.map((e) {
          return _campingItemWidget(e);
        }).toList(),
      ),
    );
  }
}
