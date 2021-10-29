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
  var toggleMap = {};
  var maxCountMap = {"region": 100, "operationType": 5, "environment": 8, "facility": 11};
  var currentMap = {"region": {}, "operationType": {}, "environment": {}, "facility": {}};
  var regionMore = false;

  Widget _filterButton(String title, String type) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            if (type == "+") {
              regionMore = true;
              return;
            } else if(type == "-"){
              regionMore = false;
              return;
            }

            if (toggleMap[title] == false) {
              var current = currentMap[type] as Map;
              var maxCount = maxCountMap[type] as int;

              if (maxCount > current.length) {
                toggleMap[title] = true;

                current[title] = true;
                currentMap[type] = current;
              } else {
                print("더이상 누를 수 없습니다!");
              }
            } else {
              toggleMap[title] = false;

              var current = currentMap[type] as Map;
              current.remove(title);
              currentMap[type] = current;
            }

            print(currentMap["region"].toString() +
                currentMap["operationType"].toString() +
                currentMap["environment"].toString() +
                currentMap["facility"].toString() );
          });
        },
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Text(
            title,
            maxLines: 1,
            style: TextStyle(
                color: !toggleMap.containsKey(title) ||
                        toggleMap[title] as bool == false
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
            color: !toggleMap.containsKey(title) ||
                    toggleMap[title] as bool == false
                ? Colors.white
                : Theme.of(context).primaryColor,
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
      body: Stack(
        children: [
          ListView(
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
                    foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return Colors.white;
                    }),
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return Colors.white;
                    }),
                    padding: MaterialStateProperty.resolveWith((states) {
                      return EdgeInsets.all(0);
                    }),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: _contentWidth - 40 - 24,
                        child: TextField(
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'NotoSansKR',
                          ),
                          controller: widget._searchController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: '검색어를 입력해주세요',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                              fontFamily: 'NotoSansKR',
                            ),
                            border: InputBorder.none,
                            labelStyle: TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.pushNamed(context, '/camping_search_result',
                              arguments: {
                                'search_data': widget._searchController.text,
                                'regionMap': currentMap["region"] as Map,
                                "operationTypeMap":
                                    currentMap["operationType"] as Map,
                                "environmentMap":
                                    currentMap["environment"] as Map
                              });
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'NotoSansKR'))
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
                    } else if (state is CampingSearchLoading) {
                      return Container(
                        color: Color(0x44232323),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is Error) {
                      return Text("Error: ");
                    } else if (state is CampingSearchLoaded) {
                      return Row(
                        children: [
                          Flexible(
                            child: Wrap(
                              children: regionMore == false
                                  ? List.generate(
                                          7,
                                          (i) => _filterButton(
                                              state.dataRegions![i],
                                              "region")) +
                                      [_filterButton("+더보기", "+")]
                                  : List.generate(
                                      state.dataRegions!.length,
                                      (i) => _filterButton(
                                          state.dataRegions![i], "region")
                                    ) + [_filterButton("-접기", "-")],
                            ),
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                  buildWhen: (previous, current) {
                    if (current is CampingSearchLoaded || current is CampingSearchLoading) {
                      return true;
                    }
                    return false;
                  },
                ),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'NotoSansKR'))
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
                    } else if (state is CampingSearchLoading) {
                      return Container(
                        color: Color(0x44232323),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is Error) {
                      return Text("Error: ");
                    } else if (state is CampingSearchLoaded) {
                      // return Text(state.dataOperationTypes.toString());
                      return Row(
                        children: [
                          Flexible(
                              child: Wrap(
                                  children: List.generate(
                                      state.dataOperationTypes!.length,
                                      (i) => _filterButton(
                                          state.dataOperationTypes![i],
                                          "operationType")))),
                        ],
                      );
                    }
                    return Container();
                  },
                  buildWhen: (previous, current) {
                    if (current is CampingSearchLoaded || current is CampingSearchLoading) {
                      return true;
                    }
                    return false;
                  },
                ),
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
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'NotoSansKR'))
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
                    } else if (state is CampingSearchLoading) {
                      return Container(
                        color: Color(0x44232323),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is Error) {
                      return Text("Error: ");
                    } else if (state is CampingSearchLoaded) {
                      // return Text(state.dataOperationTypes.toString());
                      return Row(
                        children: [
                          Flexible(
                              child: Wrap(
                                  children: List.generate(
                                      state.dataEnvironments!.length,
                                      (i) => _filterButton(
                                          state.dataEnvironments![i],
                                          "environment")))),
                        ],
                      );
                    }
                    return Container();
                  },
                  buildWhen: (previous, current) {
                    if (current is CampingSearchLoaded || current is CampingSearchLoading) {
                      return true;
                    }
                    return false;
                  },
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                  child: Row(children: [
                    SizedBox(
                      width: 20.0,
                    ),
                    Text("이용 시설",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'NotoSansKR'))
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
                    } else if (state is CampingSearchLoading) {
                      return Container(
                        color: Color(0x44232323),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is Error) {
                      return Text("Error: ");
                    } else if (state is CampingSearchLoaded) {
                      // return Text(state.dataOperationTypes.toString());
                      return Row(
                        children: [
                          Flexible(
                              child: Wrap(
                                  children: List.generate(
                                      state.dataFacilities!.length,
                                          (i) => _filterButton(
                                          state.dataFacilities![i],
                                          "facility")))),
                        ],
                      );
                    }
                    return Container();
                  },
                  buildWhen: (previous, current) {
                    if (current is CampingSearchLoaded || current is CampingSearchLoading) {
                      return true;
                    }
                    return false;
                  },
                ),
              ),
              SizedBox(
                height: 150.0,
              ),
            ],
          ),
          BlocBuilder<CampingAPIBloc, CampingAPIState>(
            builder: (_, state) {
              if (state is CampingSearchLoading) {
                return Container(
                  color: Color(0x44232323),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return Container();
            },
            buildWhen: (previous, current) {
              if (current is CampingSearchLoaded) {
                current.dataRegions!.forEach((element) {
                  toggleMap[element] = false;
                });
                current.dataEnvironments!.forEach((element) {
                  toggleMap[element] = false;
                });
                current.dataOperationTypes!.forEach((element) {
                  toggleMap[element] = false;
                });
                current.dataFacilities!.forEach((element) {
                  toggleMap[element] = false;
                });
              }
              return true;
            },
          ),
        ],
      ),
    );
  }
}
