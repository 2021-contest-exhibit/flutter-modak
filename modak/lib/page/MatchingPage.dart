import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modak/component/MatchingItemWidget.dart';

class MatchingPage extends StatefulWidget {
  int _selectedIndex = 0;

  @override
  MatchingPageState createState() => MatchingPageState();
}

class MatchingPageState extends State<MatchingPage> {
  setIndex(int index) {
    setState(() {
      widget._selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _statusBarHeight = MediaQuery.of(context).padding.top;
    final double _height = MediaQuery.of(context).size.height;
    final double _titleHeight = 48.0;
    final double _contentHeight = _height - _statusBarHeight - _titleHeight;
    final double _contentWidth = _width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: _statusBarHeight),
        child: Column(
          children: [
            const SizedBox(
              height: 18.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setIndex(0);
                    },
                    child: Text(
                      "최근",
                      style: TextStyle(
                          fontSize: widget._selectedIndex == 0 ? 28.0 : 24.0,
                          fontWeight: FontWeight.bold,
                          decoration: widget._selectedIndex == 0
                              ? TextDecoration.overline
                              : TextDecoration.none),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setIndex(1);
                    },
                    child: Text(
                      "참여한캠핑",
                      style: TextStyle(
                        fontSize: widget._selectedIndex == 1 ? 28.0 : 24.0,
                        fontWeight: FontWeight.bold,
                        decoration: widget._selectedIndex == 1
                            ? TextDecoration.overline
                            : TextDecoration.none,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setIndex(2);
                    },
                    child: Text(
                      "내캠핑",
                      style: TextStyle(
                        fontSize: widget._selectedIndex == 2 ? 28.0 : 24.0,
                        fontWeight: FontWeight.bold,
                        decoration: widget._selectedIndex == 2
                            ? TextDecoration.overline
                            : TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Visibility(
              visible: widget._selectedIndex == 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    MatchingItemWidget(),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: widget._selectedIndex == 1,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    padding: const EdgeInsets.all(12.0),
                    alignment: Alignment.bottomLeft,
                    height: 300,
                    decoration: const BoxDecoration(
                      color: Color(0x887f7f7f),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(5.0),
                      ),
                    ),
                    child: Text(
                      "참여한 캠핑",
                      style: const TextStyle(
                        color: const Color(0xffffffff),
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: widget._selectedIndex == 2,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    padding: const EdgeInsets.all(12.0),
                    alignment: Alignment.bottomLeft,
                    height: 300,
                    decoration: const BoxDecoration(
                      color: Color(0x887f7f7f),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(5.0),
                      ),
                    ),
                    child: Text(
                      "내캠핑",
                      style: const TextStyle(
                        color: const Color(0xffffffff),
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
