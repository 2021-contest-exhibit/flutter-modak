import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: CampingSearchResultPage(searchName: ''),
      ),
    ),
  ));
}

class CampingSearchResultPage extends StatefulWidget {
  final String searchName;

  const CampingSearchResultPage({required this.searchName});

  @override
  CampingSearchResultPageState createState() => CampingSearchResultPageState();
}

class CampingSearchResultPageState extends State<CampingSearchResultPage> {

  @override
  void initState() {
    print(widget.searchName + "...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}