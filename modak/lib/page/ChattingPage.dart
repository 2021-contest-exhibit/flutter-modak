import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChattingPage extends StatefulWidget {
  @override
  ChattingPageState createState() => ChattingPageState();
}

class ChattingPageState extends State<ChattingPage> {

  Widget _ChatWidget(double maxSize, bool isMyMessage, String email, String message) {
    return Column(
      children: [
        SizedBox(height: 24.0,),
        Visibility(
          visible: !isMyMessage,
          child: Row(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                    color: Color(0xff3F3F3F),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              SizedBox(width: 4.0,),
              Text(email),
            ],
          ),
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: isMyMessage ? MainAxisAlignment.end: MainAxisAlignment.start,
          children: [
            SizedBox(width: 4.0,),
            Container(
              width: maxSize,
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: AutoSizeText(
                        message,
                        overflow: TextOverflow.fade,
                      ),
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 24.0,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final _statusHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Stack(
          children: [
            Container(
              child: ListView(
                physics: BouncingScrollPhysics(),

                children: [
                  SizedBox(height: 24.0,),
                  _ChatWidget(_width / 2 - 40, false, "test@test.com", "안녕하세요.얼미ㅏㅓㄴㅇ리ㅏㅓ미러ㅏㅁㄴㅇ러ㅏㄴㅁㄹㅁ"),
                  _ChatWidget(_width / 2 - 40, false, "test@test.com", "안녕하세요.얼미ㅏㅓㄴㅇ리ㅏㅓ미러ㅏㅁㄴㅇ러ㅏㄴㅁㄹㅁ"),
                  _ChatWidget(_width / 2 - 40, false, "test@test.com", "안녕하세요.얼미ㅏㅓㄴㅇ리ㅏㅓ미러ㅏㅁㄴㅇ러ㅏㄴㅁㄹㅁ"),
                  _ChatWidget(_width / 2 - 40, true, "test@test.com", "안녕하세요.얼미ㅏㅓㄴㅇ리ㅏㅓ미러ㅏㅁㄴㅇ러ㅏㄴㅁㄹㅁ"),
                  _ChatWidget(_width / 2 - 40, false, "test@test.com", "안녕하세요.얼미ㅏㅓㄴㅇ리ㅏㅓ미러ㅏㅁㄴㅇ러ㅏㄴㅁㄹㅁ"),
                  _ChatWidget(_width / 2 - 40, false, "test@test.com", "안녕하세요.얼미ㅏㅓㄴㅇ리ㅏㅓ미러ㅏㅁㄴㅇ러ㅏㄴㅁㄹㅁ"),
                  _ChatWidget(_width / 2 - 40, false, "test@test.com", "안녕하세요.얼미ㅏㅓㄴㅇ리ㅏㅓ미러ㅏㅁㄴㅇ러ㅏㄴㅁㄹㅁ"),
                  SizedBox(height: 56,)
                ],
              ),
            ),
            Positioned(
              top: _statusHeight,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 36.0,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 12,
              child: Container(
                child: Row(
                  children: [
                    Container(
                      width: _width - 40 - 48,
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                          hintText: '',
                          hintStyle: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.send)),
                  ],
                ),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
