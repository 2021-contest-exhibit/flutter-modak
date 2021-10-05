import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: MatchingItemWidget(),
      ),
    ),
  ));
}

class MatchingItemWidget extends StatefulWidget {
  @override
  MatchingItemWidgetState createState() => MatchingItemWidgetState();
}

class MatchingItemWidgetState extends State<MatchingItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24.0),
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
                  "ysy3350",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          Image.network(
            "https://www.gocamping.or.kr/upload/camp/1335/thumb/thumb_720_3379YLFxXAtV0MZwiq1wms7p.jpg",
            height: 388,
            fit: BoxFit.fitHeight,
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
                      "별빛누리캠핑장",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      "2021.07.01 ~ 2021.07.05",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {},
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
          )
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
