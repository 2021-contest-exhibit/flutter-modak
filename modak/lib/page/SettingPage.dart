import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modak/component/ProfileWidget.dart';
import 'package:modak/dto/User.dart';

void main() {
  runApp(
    MaterialApp(
      home: SettingPage(),
    ),
  );
}

class SettingPage extends StatefulWidget {
  @override
  SettingPageState createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40.0,),
          ProfileWidget(user: User("ysy3350", 1)),
        ],
      ),
    );
  }
}
