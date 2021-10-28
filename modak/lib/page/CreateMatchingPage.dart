import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/ModakBloc.dart';
import 'package:modak/bloc/ModakEvent.dart';
import 'package:modak/bloc/ModakState.dart';
import 'package:modak/component/RecommandCampingWidget.dart';
import 'package:modak/dto/Matching.dart';
import 'package:modak/rest/Content.dart';
import 'package:modak/rest/ResponseGetCampings.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MaterialApp(
    home: CreateMatchingPage(),
  ));
}

class CreateMatchingPage extends StatefulWidget {
  @override
  CreateMatchingPageState createState() => CreateMatchingPageState();
}

class CreateMatchingPageState extends State<CreateMatchingPage> {
  late DateTime? _selectedStartDay = DateTime.now();
  late DateTime? _selectedEndDay = DateTime.now();

  String getDate() {
    return "${(_selectedStartDay ?? DateTime.now()).year}.${(_selectedStartDay ?? DateTime.now()).month}.${(_selectedStartDay ?? DateTime.now()).day} ~ ${(_selectedEndDay ?? DateTime.now()).year}.${(_selectedEndDay ?? DateTime.now()).month}.${(_selectedEndDay ?? DateTime.now()).day}";
  }

  @override
  Widget build(BuildContext context) {
    final statusHeight = MediaQuery.of(context).padding.top;
    int? selectedCampingId;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding:
                EdgeInsets.only(top: statusHeight, left: 20.0, right: 20.0),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 36.0,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Text(
                  "장소",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansKR',
                  ),
                ),
                SizedBox(
                  height: 18.0,
                ),
                Hero(
                  tag: "select_camping",
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
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/select_camping');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                BlocBuilder<ModakBloc, ModakState>(
                  builder: (context, state) {
                    if (state is CampingSelectedLoading) {
                      return CircularProgressIndicator();
                    } else if (state is CampingSelected) {
                      selectedCampingId = state.content.contentId;
                      return RecommandCampingWidget(
                        campingList:
                            ResponseGetCampings(content: [state.content]),
                      );
                    }
                    return Container();
                  },
                ),
                SizedBox(
                  height: 36.0,
                ),
                Text(
                  "날짜",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansKR',
                  ),
                ),
                TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  rangeStartDay: _selectedStartDay,
                  rangeEndDay: _selectedEndDay,
                  availableGestures: AvailableGestures.none,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                  ),
                  onRangeSelected: (start, end, focusedDay) {
                    setState(() {
                      _selectedStartDay = start;
                      _selectedEndDay = end;
                    });
                  },
                  rangeSelectionMode: RangeSelectionMode.enforced,
                ),
                SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 12.0),
                      child: Text(
                        getDate(),
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x22000000),
                            offset: Offset(2.0, 2.0),
                            blurRadius: 2.0,
                            spreadRadius: 0.1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 36.0,
                ),
                OutlinedButton(
                  onPressed: () async {
                    if (selectedCampingId != null) {
                      BlocProvider.of<ModakBloc>(context).add(
                        CreateMatchingEvent(
                          createDate: DateTime.now(),
                          startDate: _selectedStartDay!,
                          endDate: _selectedEndDay!,
                          campingId: selectedCampingId!,
                        ),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "매칭하기",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.resolveWith((states) {
                      return Size(double.infinity, 48.0);
                    }),
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return Theme.of(context).primaryColor;
                    }),
                    foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return Colors.white;
                    }),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
              ],
            ),
          ),
          BlocBuilder<ModakBloc, ModakState>(
            builder: (context, state) {
              if (state is Loading) {
                return Container(
                  color: Color(0xff363636),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return Container();
            },
            buildWhen: (previous, current) {
              if (current is Loading) {
                Navigator.pop(context);
              }else if (current is Error) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(current.message)));
              }
              return true;
            },
          ),
        ],
      ),
    );
  }
}
