import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/CampingAPIBloc.dart';
import 'package:modak/bloc/CampingAPIEvent.dart';
import 'package:modak/bloc/CampingAPIState.dart';
import 'package:modak/component/RecommandCampingWidget.dart';
import 'package:modak/rest/ResponseGetCampings.dart';

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
  final argument;

  CampingSearchResultPage({this.argument});

  @override
  CampingSearchResultPageState createState() => CampingSearchResultPageState();
}

class CampingSearchResultPageState extends State<CampingSearchResultPage> {
  @override
  void initState() {
    String searchData = widget.argument['search_data'];
    Map regionMap = widget.argument['regionMap'];
    Map operationTypeMap = widget.argument['operationTypeMap'];
    Map environmentMap = widget.argument['environmentMap'];
    Map facilityMap = widget.argument['facilityMap'];

    BlocProvider.of<CampingAPIBloc>(context).add(
      FindCampinsEvent(
          nameContains: searchData,
          regionMap: regionMap,
          operationTypeMap: operationTypeMap,
          environmentMap: environmentMap,
          facilityMap: facilityMap),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _contentWidth = _width - 40;

    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 24.0,
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
              onPressed: () {
                Navigator.pop(context);
              },
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
                      widget.argument['search_data'],
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                BlocBuilder<CampingAPIBloc, CampingAPIState>(
                  builder: (context, state) {
                    if (state is Empty) {
                      return Container();
                    } else if (state is SearchLoading) {
                      return Container(
                        color: Color(0x44232323),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is Error) {
                      return Text("Error: ");
                    } else if (state is CampingsLoaded) {
                      return RecommandCampingWidget(
                        campingList:
                            ResponseGetCampings(content: state.content),
                      );
                    }
                    return Container();
                  },
                  buildWhen: (previous, current) {
                    if (current is CampingsLoaded || current is SearchLoading) {
                      return true;
                    }
                    return false;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
