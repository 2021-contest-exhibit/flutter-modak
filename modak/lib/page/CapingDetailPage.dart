import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: CampingDetailPage(),
      ),
    ),
  ));
}

class CampingDetailPage extends StatefulWidget {
  final PageController _controller = new PageController(initialPage: 0);
  int _currentPage = 1;

  @override
  CampingDetailPageState createState() => CampingDetailPageState();
}

class CampingDetailPageState extends State<CampingDetailPage> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    widget._controller.addListener(() {
      setState(() {
        widget._currentPage = ((widget._controller.page ?? 1) + 1).toInt();
      });
    });
    return Scaffold(
      body: ListView(
        children: [
          Container(
              height: 388,
              child: Stack(
                children: [
                  PageView(
                    controller: widget._controller,
                    children: [
                      Image.network(
                        "https://www.gocamping.or.kr/upload/camp/1335/thumb/thumb_720_3379YLFxXAtV0MZwiq1wms7p.jpg",
                        height: 388,
                        fit: BoxFit.fitHeight,
                      ),
                      Image.network(
                        "https://www.gocamping.or.kr/upload/camp/7150/thumb/thumb_720_60497nQtHJrTdiezfiaLBaGE.jpg",
                        height: 388,
                        fit: BoxFit.fitHeight,
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 12.0,
                    left: 12.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "${widget._currentPage}/6",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          color: Color(0x662F2F2F)),
                    ),
                  ),
                  Positioned(
                    top: 12.0,
                    left: 12.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white,),
                    ),
                  )
                ],
              )),
          Container(
            margin: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "덕이네 펜션&캠핑",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                Text(
                  "92",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Container(
            width: _width,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Flexible(
                  child: Wrap(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          "봄",
                          maxLines: 1,
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          "여름",
                          maxLines: 1,
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          "가을",
                          maxLines: 1,
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          "겨울",
                          maxLines: 1,
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          "친절한",
                          maxLines: 1,
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          "깨끗한",
                          maxLines: 1,
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          "차대기 편함",
                          maxLines: 1,
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          "힐링",
                          maxLines: 1,
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "주소",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 4.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "강원 홍천군 서면 안굴업길 39-13 덕이네펜션&캠핑",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
                Row(
                  children: [
                    Text(
                      "문의처",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 4.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "033-432-8829",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
                Text(
                  "비발디파크 양평 쪽 진입로 입구 가까이에 자리잡은 덕이네 캠핑장은 앞으로는 굵직한 용마산 자락, 뒤로는 아늑한 매봉산에 둘러싸인 깨끗한 환경을 자랑하는 캠핑장으로 펜션과 함께 운영하고 있다. 캠핑장은 관리소를 중간에 두고 위쪽의 힐링존과 아래쪽의 플레이존으로 구분되어 있는데, 힐링존은 조용한 캠핑을 원하는 솔로 및 커플을 위한 공간으로 플에이존은 뛰어노는 아이들을 위한 공간으로 잔디밭으로 구성하였으며, 안전을 위해 차량 진입을 금지하고 있다. 캠핑장에는 펜션시설외에 27개의 사이트에 수영장과 트램펄린, 샤워실, 개수대, 매점 등이 함께 있어 불편함 없이 캠핑을 즐길 수 있다.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
