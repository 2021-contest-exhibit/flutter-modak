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
    final double _width = MediaQuery.of(context).size.width;
    final double _contentWidth = _width - 40;
    return Scaffold(
      body: Stack (
        children: [
          Positioned(
            top: 48,
            child: Container(
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
                  onPressed: () {
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () { Navigator.pop(context); },
                        icon: Icon(Icons.arrow_back),
                        color: Colors.black
                      ),
                      Text("검색어를 입력해주세요", style: TextStyle(color: Colors.grey, fontSize: 20)),
                      Icon(Icons.search, color: Colors.black, )
                    ],
                  ),
                )
            ),
          ),

        ]
      )

    );
  }
}