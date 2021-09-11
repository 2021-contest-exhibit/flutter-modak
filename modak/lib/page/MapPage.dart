import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modak/component/MapWidget.dart';

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Widget floatingControlButton(Widget icon) {
    return FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        mini: true,
        child: icon);
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _contentWidth = _width - 40;
    return Scaffold(
      body: Stack(
        children: [
          MapWidget(),
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
                  children: [Icon(Icons.search, color: Colors.black,)],
                ),
              )
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
