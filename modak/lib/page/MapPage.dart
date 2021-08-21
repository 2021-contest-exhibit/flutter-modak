import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {

  Widget floatingControlButton(Widget icon) {
    return Positioned(
      child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.black,
          mini: true,
          child: icon
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _contentWidth = _width - 80;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 48,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: InkWell(
                onTap: () {},
                child: Ink(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: _contentWidth,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.search)
                      ],
                    ),
                  ),
                  decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x22000000),
                          offset: Offset(2.0, 2.0),
                          blurRadius: 2.0,
                          spreadRadius: 0.1,
                        ),
                      ]),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 20,
            child: Column(
              children: [
                floatingControlButton(Image.asset(
                  'image/logo.png',
                  width: 16.0,
                  height: 16.0,
                )),
                floatingControlButton(Icon(Icons.ac_unit)),
                floatingControlButton(Icon(Icons.ac_unit)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
