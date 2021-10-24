import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  double _progress = 0.0;

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = new AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animation = new Tween<double>(begin: 0, end: 1.0).animate(_animationController)
    ..addListener(() {
      setState(() {
        widget._progress = _animation.value;
      });
    })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
      }
    });
    _animationController.forward();
  }

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
                  Image.asset('image/logo.png',width: 48.0, height: 48.0,),
                  Text(
                    "MODAK",
                    style: TextStyle(fontSize: 48.0, color: Colors.white, fontWeight: FontWeight.bold,
                        fontFamily: 'NotoSansCJKkr'),
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
                minHeight: 1.0,
                backgroundColor: Colors.white,
                color: Theme.of(context).primaryColor,
                value: widget._progress,
              )),
        ],
      ),
    ));
  }
}
