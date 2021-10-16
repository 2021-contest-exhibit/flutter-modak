import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: CampingSearchPage(),
      ),
    ),
  ));
}


class CampingSearchPage extends StatefulWidget {
  @override
  CampingSearchPageState createState() => CampingSearchPageState();
}


class CampingSearchPageState extends State<CampingSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}