import 'package:auto_size_text/auto_size_text.dart';
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
      color: Color(0xffF8F8F8),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/camping_detail', arguments: camping);
        },
        child: Ink(
          decoration: const BoxDecoration(
            color: Color(0xffFFFFFF),
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
                  child: (camping.thumbnailImageUrl != null &&camping.thumbnailImageUrl != "") ? Image.network(
                    camping.thumbnailImageUrl!,
                    fit: BoxFit.fitHeight,
                  ) : Center(child: Image.asset('image/logo_black.png',width: 36.0, height: 36.0,)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 6, left: 24, right: 24),
                width: (_width-40) * 55/100,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0,),
                    AutoSizeText(
                      camping.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: const Color(0xff000000),
                        fontSize: 18.0,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12.0,),
                    Flexible(
                      child: Text(
                        camping.addr!,
                        maxLines: 2,
                        style: const TextStyle(
                          color: const Color(0xff8f8f8f),
                          fontSize: 12.0,
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
                          "${camping.goodCount??0}"
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
