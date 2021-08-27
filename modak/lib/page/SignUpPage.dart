import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SignUpPage(),
    ),
  );
}

class SignUpPage extends StatefulWidget {
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 92.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    'image/logo_black.png',
                    width: 48.0,
                    height: 48.0,
                  ),
                  Text(
                    "Modak",
                    style:
                        TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 48.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.all(8.0),
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
                ]),
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: '이메일을 입력해주세요.',
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
          const SizedBox(
            height: 24.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.all(8.0),
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
                ]),
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: '비밀번호를 입력해주세요.',
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
          const SizedBox(
            height: 24.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.all(8.0),
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
                ]),
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: '비밀번호를 입력해주세요.',
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
          const SizedBox(
            height: 24.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: OutlinedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "회원가입",
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
          ),
          const SizedBox(
            height: 36.0,
          ),
        ],
      ),
    );
  }
}
