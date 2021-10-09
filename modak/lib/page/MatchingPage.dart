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
    final double _contentHeight = _height - _statusBarHeight - 100;
    final double _contentWidth = _width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
                              fontSize:
                                  widget._selectedIndex == 0 ? 28.0 : 24.0,
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
                Visibility(
                  visible: widget._selectedIndex == 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    height: _contentHeight,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return MatchingItemWidget();
                      },
                      itemCount: 4,
                      physics: BouncingScrollPhysics(),
                    ),
                  ),
                ),
                Visibility(
                  visible: widget._selectedIndex == 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    height: _contentHeight,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return MatchingItemWidget();
                      },
                      itemCount: 4,
                      physics: BouncingScrollPhysics(),
                    ),
                  ),
                ),
                Visibility(
                  visible: widget._selectedIndex == 2,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    height: _contentHeight,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return MatchingItemWidget();
                      },
                      itemCount: 4,
                      physics: BouncingScrollPhysics(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 82.0,
            right: 24.0,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
