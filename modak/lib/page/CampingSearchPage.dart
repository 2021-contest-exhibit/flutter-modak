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
  Widget _filterButton(String title) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Text(
        title,
        maxLines: 1,
        style: TextStyle(color: Colors.black),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(2.0),
        ),
      ),
    );
  }

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
      body: Column (
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
          SizedBox(
            height: 48.0,
          ),
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: 20.0,
                ),
                Text("지역별", style: TextStyle(fontWeight:FontWeight.bold, fontSize: 20 )) ]
            )
          ),
          SizedBox(
            height: 24.0,
          ),
          Container(
            child: BlocBuilder<CampingAPIBloc, CampingAPIState>(
              builder: (_, state) {
                if (state is Empty) {
                  return Container();
                } else if (state is Loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is Error) {
                  return Text("Error: ");
                } else if (state is Loaded) {
                  // return Text(state.dataOperationTypes.toString());
                  return Flexible(

                      child:
                      Wrap(
                          children: List.generate(
                              7 , (i) => _filterButton(state.dataRegions![i])
                          ) + [
                            _filterButton("+더보기")
                          ]
                      )
                  );
                }
                return Container();
              }),
          ),
          SizedBox(
            height: 24.0,
          ),
          Container(
              child: Row(
                  children: [
                    SizedBox(
                      width: 20.0,
                    ),
                    Text("운영 형태", style: TextStyle(fontWeight:FontWeight.bold, fontSize: 20 )) ]
              )
          ),
          SizedBox(
            height: 24.0,
          ),
          Container(
            child: BlocBuilder<CampingAPIBloc, CampingAPIState>(
                builder: (_, state) {
                  if (state is Empty) {
                    return Container();
                  } else if (state is Loading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is Error) {
                    return Text("Error: ");
                  } else if (state is Loaded) {
                    // return Text(state.dataOperationTypes.toString());
                    return Flexible(

                        child:
                        Wrap(
                            children: List.generate(
                                state.dataOperationTypes!.length, (i) => _filterButton(state.dataOperationTypes![i])
                            )
                        )
                    );
                  }
                  return Container();
                }),
          ),
          SizedBox(
            height: 24.0,
          ),
          Container(
              child: Row(
                  children: [
                    SizedBox(
                      width: 20.0,
                    ),
                    Text("입지 구분", style: TextStyle(fontWeight:FontWeight.bold, fontSize: 20 )) ]
              )
          ),
          SizedBox(
            height: 24.0,
          ),
          Container(
            child: BlocBuilder<CampingAPIBloc, CampingAPIState>(
                builder: (_, state) {
                  if (state is Empty) {
                    return Container();
                  } else if (state is Loading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is Error) {
                    return Text("Error: ");
                  } else if (state is Loaded) {
                    // return Text(state.dataOperationTypes.toString());
                    return Flexible(

                        child:
                        Wrap(
                            children: List.generate(
                                state.dataEnvironments!.length, (i) => _filterButton(state.dataEnvironments![i])
                            )
                        )
                    );
                  }
                  return Container();
                }),
          ),

        ]
      )

    );
  }
}