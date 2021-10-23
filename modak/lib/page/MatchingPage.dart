import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/ModakBloc.dart';
import 'package:modak/bloc/ModakEvent.dart';
import 'package:modak/bloc/ModakState.dart';
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
      if (index == 0) {
        BlocProvider.of<ModakBloc>(context).add(LoadMatchingEvent());
      } else if (index == 2) {
        BlocProvider.of<ModakBloc>(context).add(LoadMyMatchingEvent());
      }
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
                            fontSize: widget._selectedIndex == 0 ? 28.0 : 24.0,
                            fontWeight: FontWeight.bold,
                          ),
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
                    child: BlocBuilder<ModakBloc, ModakState>(
                      builder: (_, state) {
                        print("state---: ${state}");
                        if (state is Empty) {
                          return Container();
                        } else if (state is MatchingLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is Error) {
                          return Text("Error: " + state.message);
                        } else if (state is MatchingLoaded) {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return MatchingItemWidget(
                                userName: state.matchings![index].email!,
                                campingName:
                                    state.matchings![index].content!.name!,
                                startDate:
                                    state.matchings![index].matching!.startDate,
                                endDate:
                                    state.matchings![index].matching!.endDate,
                                matchingId: state.matchings![index].matchingId!,
                              );
                            },
                            itemCount: state.matchings!.length,
                            physics: BouncingScrollPhysics(),
                          );
                        }
                        return Container();
                      },
                      buildWhen: (previous, current) =>
                          current is MatchingLoading ||
                          current is MatchingLoaded,
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
                        return MatchingItemWidget(
                          campingName: "",
                          endDate: DateTime.now(),
                          startDate: DateTime.now(),
                          userName: "",
                          matchingId: "",
                        );
                      },
                      itemCount: 0,
                      physics: BouncingScrollPhysics(),
                    ),
                  ),
                ),
                Visibility(
                  visible: widget._selectedIndex == 2,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    height: _contentHeight,
                    child: BlocBuilder<ModakBloc, ModakState>(
                      builder: (_, state) {
                        print('mymatching');
                        if (state is Empty) {
                          return Container();
                        } else if (state is MyMatchingLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is Error) {
                          return Text("Error: " + state.message);
                        } else if (state is MyMatchingLoaded) {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return MatchingItemWidget(
                                userName: state.matchings![index].email!,
                                campingName:
                                    state.matchings![index].content!.name!,
                                startDate:
                                    state.matchings![index].matching!.startDate,
                                endDate:
                                    state.matchings![index].matching!.endDate,
                                matchingId: state.matchings![index].matchingId!,
                              );
                            },
                            itemCount: state.matchings!.length,
                            physics: BouncingScrollPhysics(),
                          );
                        }
                        return Container();
                      },
                      buildWhen: (previous, current) =>
                          current is MyMatchingLoading ||
                          current is MyMatchingLoaded,
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
              onPressed: () {
                Navigator.pushNamed(context, '/create_matching');
              },
              child: Icon(Icons.add),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<ModakBloc>(context).add(LoadMatchingEvent());
    BlocProvider.of<ModakBloc>(context).add(LoadMyMatchingEvent());
  }
}
