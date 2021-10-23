import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modak/dto/ModakMatching.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: MatchingItemWidget(modakMatching: ModakMatching(),),
      ),
    ),
  ));
}

class MatchingItemWidget extends StatefulWidget {
  final ModakMatching modakMatching;

  MatchingItemWidget({required this.modakMatching});

  @override
  MatchingItemWidgetState createState() => MatchingItemWidgetState();
}

class MatchingItemWidgetState extends State<MatchingItemWidget> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 56.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      color: Color(0xff3F3F3F),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                SizedBox(
                  width: 24,
                ),
                Text(
                  widget.modakMatching.content!.name!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          Image.network(
            widget.modakMatching.content!.thumbnailImageUrl!,
            height: 240,
            width: _width,
            fit: BoxFit.fitWidth,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.modakMatching.content!.name!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      "${widget.modakMatching.matching!.startDate.year}.${widget.modakMatching.matching!.startDate.month}.${widget.modakMatching.matching!.startDate.day} ~ ${widget.modakMatching.matching!.endDate.year}.${widget.modakMatching.matching!.endDate.month}.${widget.modakMatching.matching!.endDate.day}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/payment", arguments: widget.modakMatching);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.chat_outlined,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "참여하기",
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return Color(0xff87360C);
                    }),
                    foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return Colors.white;
                    }),
                    padding: MaterialStateProperty.resolveWith((states) {
                      return EdgeInsets.symmetric(horizontal: 8.0);
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
    );
  }
}
