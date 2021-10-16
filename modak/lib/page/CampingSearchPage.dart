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
  final TextEditingController _searchController = TextEditingController();

  @override
  CampingSearchPageState createState() => CampingSearchPageState();
}

class CampingSearchPageState extends State<CampingSearchPage> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _contentWidth = _width - 40;
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: _contentWidth * 0.7,
                    child: TextField(
                      controller: widget._searchController,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: '검색어를 입력해주세요',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20.0,
                        ),
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
