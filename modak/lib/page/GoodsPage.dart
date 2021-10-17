import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/CampingAPIBloc.dart';
import 'package:modak/bloc/CampingAPIEvent.dart';
import 'package:modak/bloc/CampingAPIState.dart';
import 'package:modak/component/RecommandCampingWidget.dart';
import 'package:modak/rest/ResponseGetCampings.dart';
import 'package:modak/rest/ResponseGetUser.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: GoodsPage(),
      ),
    ),
  ));
}

class GoodsPage extends StatefulWidget {
  @override
  State createState() => GoodsPageState();
}

class GoodsPageState extends State<GoodsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Stack(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 36.0,
                        ),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  Center(
                    child: Container(
                      height: 36,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("좋아요", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        ],
                      )
                    ),
                  )
                ],
              ),
            ),
            BlocBuilder<CampingAPIBloc, CampingAPIState>(
              builder: (context, state) {
                if (state is UserGoodsLoaded && state.user.content[0].goods.length > 0) {
                  return RecommandCampingWidget(
                    campingList: ResponseGetCampings(content: [...state.user.content[0].goods.map((e) {
                      return e.camping;
                    }).toList()]),
                  );
                }
                return Container();
              },
              buildWhen: (previous, current) {
                if (current is UserGoodsLoaded) {
                  return true;
                } else {
                  return false;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<CampingAPIBloc>(context).add(
        GetUserGoodsEvent()
    );
  }
}
