import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: CampingSearchResultPage(),
      ),
    ),
  ));
}

class CampingSearchResultPage extends StatefulWidget {

  @override
  CampingSearchResultPageState createState() => CampingSearchResultPageState();
}

class CampingSearchResultPageState extends State<CampingSearchResultPage> {

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    print(args);



    return Scaffold(

    );
  }
}