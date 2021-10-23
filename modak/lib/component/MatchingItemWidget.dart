import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: MatchingItemWidget(campingName: "", endDate: DateTime.now(), startDate: DateTime.now(), userName: "", matchingId: '',),
      ),
    ),
  ));
}

class MatchingItemWidget extends StatefulWidget {
  final String userName;
  final String campingName;
  final String matchingId;
  final DateTime startDate;
  final DateTime endDate;

  MatchingItemWidget({required this.userName, required this.campingName, required this.startDate, required this.endDate, required this.matchingId});

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
                  widget.userName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          Image.network(
            "https://www.gocamping.or.kr/upload/camp/1335/thumb/thumb_720_3379YLFxXAtV0MZwiq1wms7p.jpg",
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
                      widget.campingName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      "${widget.startDate.year}.${widget.startDate.month}.${widget.startDate.day} ~ ${widget.endDate.year}.${widget.endDate.month}.${widget.endDate.day}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/payment", arguments: widget.matchingId);
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
