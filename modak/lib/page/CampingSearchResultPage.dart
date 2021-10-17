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
    final double _width = MediaQuery.of(context).size.width;
    final double _contentWidth = _width - 40;
    final args = ModalRoute.of(context)!.settings.arguments as Map;



    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 48.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            width: _contentWidth,
            height: 48,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.white;
                }),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.white;
                }),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      args['search_data'],
                      style: TextStyle(color: Colors.black, fontSize: 18 ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}