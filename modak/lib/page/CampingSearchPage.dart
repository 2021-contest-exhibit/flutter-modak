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
  final TextEditingController _searchController = TextEditingController();

  @override
  CampingSearchPageState createState() => CampingSearchPageState();
}

class CampingSearchPageState extends State<CampingSearchPage> {
  Widget _filterButton(String title) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Ink(
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
            boxShadow: [
              BoxShadow(
                color: Color(0x22000000),
                offset: Offset(2.0, 2.0),
                blurRadius: 2.0,
                spreadRadius: 0.1,
              ),
            ],
          ),
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
                  IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pushNamed(context, '/camping_search_result', arguments: {'search_data': widget._searchController.text} );
                    },
                  ),
                ],
              ),
            ),
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
                Text("지역별",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
              ],
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                return Row(
                  children: [
                    Flexible(
                        child: Wrap(
                            children: List.generate(
                                    7,
                                    (i) =>
                                        _filterButton(state.dataRegions![i])) +
                                [_filterButton("+더보기")])),
                  ],
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
                Text("운영 형태",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
              ],
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                return Row(
                  children: [
                    Flexible(
                        child: Wrap(
                            children: List.generate(
                                state.dataOperationTypes!.length,
                                (i) => _filterButton(
                                    state.dataOperationTypes![i])))),
                  ],
                );
              }
              return Container();
            }),
          ),
          SizedBox(
            height: 24.0,
          ),
          Container(
              child: Row(children: [
            SizedBox(
              width: 20.0,
            ),
            Text("입지 구분",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
          ])),
          SizedBox(
            height: 24.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                return Row(
                  children: [
                    Flexible(
                        child: Wrap(
                            children: List.generate(
                                state.dataEnvironments!.length,
                                (i) => _filterButton(
                                    state.dataEnvironments![i])))),
                  ],
                );
              }
              return Container();
            }),
          ),
          SizedBox(
            height: 150.0,
          ),
        ],
      ),
    );
  }
}
