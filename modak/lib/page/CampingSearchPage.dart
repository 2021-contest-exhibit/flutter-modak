import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/CampingAPIBloc.dart';
import 'package:modak/bloc/CampingAPIEvent.dart';
import 'package:modak/bloc/CampingAPIState.dart';

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
  void initState() {
    BlocProvider.of<CampingAPIBloc>(context).add(
      GetCampingsFilterDataEvent(),
    );



  }

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
          Container(
            height: 100,
            child: BlocBuilder<CampingAPIBloc, CampingAPIState>(
              builder: (_, state) {
                if (state is Empty) {
                  return Container();
                } else if (state is Loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is Error) {
                  return Text("Error: ");
                } else if (state is Loaded) {
                  return Text(state.dataEnvironments![0].toString() + "\n" + state.dataRegions![0].toString() + "\n" + state.dataOperationTypes![0].toString());
                }
                return Container();
              }),
          )
        ]
      )

    );
  }
}