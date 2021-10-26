import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/ModakBloc.dart';
import 'package:modak/bloc/ModakEvent.dart';
import 'package:modak/bloc/ModakState.dart';
import 'package:modak/component/MatchingItemWidget.dart';
import 'package:modak/dto/ModakMatching.dart';

class MatchingPage extends StatefulWidget {
  int _selectedIndex = 0;

  @override
  MatchingPageState createState() => MatchingPageState();
}

class MatchingPageState extends State<MatchingPage> {
  final List<ModakMatching> newModakMatchings = [];
  bool newModakMatchingsLoading = false;


  setIndex(int index) {
    setState(() {
      widget._selectedIndex = index;
      if (index == 0) {
        BlocProvider.of<ModakBloc>(context).add(LoadMatchingEvent());
      } else if (index == 1) {
        BlocProvider.of<ModakBloc>(context).add(LoadJoinMatchingEvent());
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
    final double _contentHeight = _height - _statusBarHeight - 112 - 9;
    final double _contentWidth = _width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: _statusBarHeight),
            child: Column(
              children: [
                const SizedBox(
                  height: 12.0,
                ),
                const SizedBox(
                  height: 9.0,
                ),
                const SizedBox(
                  height: 9.0,
                ),
                Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setIndex(0);
                        },
                        child: Text(
                          "NEW",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: widget._selectedIndex == 0
                                ? FontWeight.bold
                                : null,
                            fontFamily: widget._selectedIndex == 0 ? 'NotoSansKR' : 'NotoSansKR'
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setIndex(1);
                        },
                        child: Text(
                          "JOINED",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: widget._selectedIndex == 1
                                ? FontWeight.bold
                                : null,
                            fontFamily: widget._selectedIndex == 1 ? 'NotoSansKR' : 'NotoSansKR'
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setIndex(2);
                        },
                        child: Text(
                          "MY",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: widget._selectedIndex == 2
                                ? FontWeight.bold
                                : null,
                            fontFamily: widget._selectedIndex == 2 ? 'NotoSansKR' : 'NotoSansKR'
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Divider(
                    thickness: 0.2,
                    color: Colors.black,
                    height: 0.1,
                  ),
                ),
                Visibility(
                  visible: widget._selectedIndex == 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    height: _contentHeight,
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification.metrics.maxScrollExtent < notification.metrics.pixels) {
                          if (newModakMatchings.length > 0 && !newModakMatchingsLoading){
                            newModakMatchingsLoading = true;
                            BlocProvider.of<ModakBloc>(context).add(LoadMatchingEvent(lastDate: newModakMatchings[newModakMatchings.length - 1].matching!.createDate.toIso8601String()));
                          }
                        }
                        return true;
                      },
                      child: BlocBuilder<ModakBloc, ModakState>(
                        builder: (_, state) {
                          if (state is MatchingLoaded) {
                            if (state.matchings!.length > 0){
                              print('machings: ${state.matchings![0].matching!.createDate}');
                              newModakMatchings.addAll(state.matchings!);
                            }
                            newModakMatchingsLoading = false;
                            return ListView.builder(
                              itemBuilder: (context, index) {
                                return MatchingItemWidget(
                                  modakMatching: newModakMatchings[index],
                                );
                              },
                              itemCount: newModakMatchings.length,
                              physics: BouncingScrollPhysics(),
                            );
                          }
                          return Container();
                        },
                        buildWhen: (previous, current) =>
                            current is MatchingLoaded,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: widget._selectedIndex == 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    height: _contentHeight,
                    child: BlocBuilder<ModakBloc, ModakState>(
                      builder: (_, state) {
                        if (state is Empty) {
                          return Container();
                        } else if (state is JoinMatchingLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is Error) {
                          return Center(child: Text(state.message));
                        } else if (state is JoinMatchingLoaded) {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return MatchingItemWidget(
                                modakMatching: state.matchings![index],
                              );
                            },
                            itemCount: state.matchings!.length,
                            physics: BouncingScrollPhysics(),
                          );
                        }
                        return Container();
                      },
                      buildWhen: (previous, current) =>
                      current is JoinMatchingLoading ||
                          current is JoinMatchingLoaded,
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
                        if (state is Empty) {
                          return Container();
                        } else if (state is MyMatchingLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is Error) {
                          return Center(child: Text(state.message));
                        } else if (state is MyMatchingLoaded) {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return MatchingItemWidget(
                                modakMatching: state.matchings![index],
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
    BlocProvider.of<ModakBloc>(context).add(LoadJoinMatchingEvent());
  }
}
