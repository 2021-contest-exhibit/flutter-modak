import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modak/dto/Camping.dart';

class TodayCompingWidget extends StatefulWidget {
  List<Camping> recipeList;

  TodayCompingWidget({required this.recipeList});

  @override
  _TodayCompingWidgetState createState() => _TodayCompingWidgetState();
}

class _TodayCompingWidgetState extends State<TodayCompingWidget> {
  Widget _campingItemWidget(index) {
    return Container(
      width: 140,
      height: 180,
      margin: const EdgeInsets.only(right: 24.0, top: 12.0, bottom: 12.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 120,
          height: 180,
          alignment: Alignment.bottomLeft,
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
          child: Column(
            children: [
              Container(
                width: 140,
                height: 174,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
                  child: Image.network(
                    "https://www.gocamping.or.kr/upload/camp/7150/thumb/thumb_720_60497nQtHJrTdiezfiaLBaGE.jpg",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0),
                    bottomRight: const Radius.circular(15.0),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.recipeList[index].title,
                          style: const TextStyle(
                            color: const Color(0xff000000),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2.0,),
                    Text(
                      widget.recipeList[index].discription,
                      maxLines: 1,
                      style: const TextStyle(
                        color: const Color(0xff8f8f8f),
                        fontSize: 8.0,
                      ),
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
      height: 246,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.recipeList.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _campingItemWidget(index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
