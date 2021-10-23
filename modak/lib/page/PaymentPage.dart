import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/ModakBloc.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PaymentPage(),
  ));
}

class PaymentPage extends StatefulWidget {
  late String matchingId;
  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {

  @override
  Widget build(BuildContext context) {
    final double _statusBarHeight = MediaQuery.of(context).padding.top;
    final double _height = MediaQuery.of(context).size.height;
    final double _contentHeight = _height + _statusBarHeight;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: ListView(
              children: [
                Image.network(
                  "https://www.gocamping.or.kr/upload/camp/1335/thumb/thumb_720_3379YLFxXAtV0MZwiq1wms7p.jpg",
                  height: 340,
                  fit: BoxFit.fitHeight,
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                                color: Color(0xff3F3F3F),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Text(
                            "ysy3350",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "장소",
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
                            "별빛누리캠핑장",
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
                            "일정",
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
                            "2021.07.01 ~ 2021.07.05",
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
                            "결제",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 200,
                                child: RadioListTile(
                                  value: 0,
                                  groupValue: 0,
                                  onChanged: (value) {},
                                  title: Text(
                                    "신용/체크 카드",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "결제 금액",
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
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "매칭비용",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "3900원",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "프리미엄",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "-3900원",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "결제금액",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "0원",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Theme.of(context).primaryColor
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/chatting", arguments: widget.matchingId);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "매칭하기",
                              style:
                              TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.resolveWith((states) {
                            return Size(double.infinity, 48.0);
                          }),
                          backgroundColor: MaterialStateProperty.resolveWith((states) {
                            return Color(0xff87360C);
                          }),
                          foregroundColor: MaterialStateProperty.resolveWith((states) {
                            return Colors.white;
                          }),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    widget.matchingId = ModalRoute.of(context)!.settings.arguments as String;
  }
}
