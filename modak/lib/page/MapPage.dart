
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: InkWell(
              onTap: () {},
              child: Ink(
                height: 64,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Stack(
                  children: [

                  ],
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
          ))
        ],
      ),
    );
  }
}