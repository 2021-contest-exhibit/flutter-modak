import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            color: Colors.black,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('image/logo.png'),
                  Text(
                    "Modak",
                    style: TextStyle(fontSize: 48.0, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 60.0,
              left: 20.0,
              right: 20.0,
              child: LinearProgressIndicator(
                backgroundColor: Colors.white,
                color: Color(0xff87360C),
              )),
        ],
      ),
    ));
  }
}
