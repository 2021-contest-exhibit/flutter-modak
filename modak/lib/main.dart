import 'package:flutter/material.dart';
import 'package:modak/page/DashBoardPage.dart';
import 'package:modak/page/MainPage.dart';
import 'package:modak/page/SplashPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/splash': (context) => SplashPage(),
        '/dashboard': (context) => DashBoardPage(),
        '/': (context) => MainPage(),
      },
    );
  }
}
