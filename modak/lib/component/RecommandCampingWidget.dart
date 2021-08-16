import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modak/DTO/Camping.dart';

class RecommandCampingWidget extends StatefulWidget {
  List<Camping> campingList;

  RecommandCampingWidget({required this.campingList});

  @override
  RecommandCampingWidgetState createState() => RecommandCampingWidgetState();
}

class RecommandCampingWidgetState extends State<RecommandCampingWidget> {
  Widget _campingItemWidget(Camping camping) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 18.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(12.0),
          alignment: Alignment.bottomLeft,
          decoration: const BoxDecoration(
            color: Color(0x887f7f7f),
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            ),
          ),
          child: Text(
            camping.name,
            style: const TextStyle(
              color: const Color(0xffffffff),
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: widget.campingList.map((e) {
          return _campingItemWidget(e);
        }).toList(),
      ),
    );
  }
}
