import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modak/dto/Camping.dart';
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
          Navigator.pushNamed(context, '/camping_detail');
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
                  child: Image.network(
                    "https://www.gocamping.or.kr/upload/camp/7150/thumb/thumb_720_60497nQtHJrTdiezfiaLBaGE.jpg",
                    fit: BoxFit.fitHeight,
                  ),
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
                      camping.name,
                      style: const TextStyle(
                        color: const Color(0xff000000),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Flexible(
                      child: Text(
                        camping.addr,
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
                          "228"

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
