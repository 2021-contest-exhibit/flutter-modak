import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/CampingAPIBloc.dart';
import 'package:modak/bloc/CampingAPIEvent.dart';
import 'package:modak/bloc/CampingAPIState.dart';
import 'package:modak/dto/Camping.dart';
import 'package:modak/rest/Content.dart';
import 'package:modak/rest/ResponseGetCampings.dart';

class TodayCompingWidget extends StatefulWidget {
  List<Content> campingList;

  TodayCompingWidget({required this.campingList});

  @override
  _TodayCompingWidgetState createState() => _TodayCompingWidgetState();
}

class _TodayCompingWidgetState extends State<TodayCompingWidget> {



  Widget _campingItemWidget(index, Content content) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only( top: 12.0, bottom: 12.0, left: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/camping_detail', arguments: content);
        },
        child: Ink(
          width: 70,
          height: 120,
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: const BorderRadius.all(
              const Radius.circular(15.0),
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
          child: Stack(
            children: [
              Container(
                width: 140,
                height: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0), bottomLeft: Radius.circular(15.0)),
                  child: (content.thumbnailImageUrl != null && content.thumbnailImageUrl != "") ? Image.network(
                    content.thumbnailImageUrl!,
                    fit: BoxFit.fitHeight,
                  ) : Center(child: Image.asset('image/logo_black.png',width: 36.0, height: 36.0,)),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0),
                    bottomRight: const Radius.circular(15.0),
                  ),
                ),
              ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.6, 0.95],
                ),
              ),
            ),
          ),
              Positioned(
                bottom: 8.0,
                left: 4.0,
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Container(
                        width: 124,
                        child: AutoSizeText(
                          content.name??"",
                          minFontSize: 1.0,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoSansKR',
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      // const SizedBox(height: 2.0,),
                      // Text(
                      //   content.shortDescription!,
                      //   maxLines: 1,
                      //   style: const TextStyle(
                      //     color: const Color(0xff8f8f8f),
                      //     fontSize: 8.0,
                      //   ),
                      // )
                    ],
                  ),
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
      height: 160,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.campingList.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _campingItemWidget(index, widget.campingList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

}
