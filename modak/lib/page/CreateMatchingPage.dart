import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return "${(_selectedStartDay??DateTime.now()).year}.${(_selectedStartDay??DateTime.now()).month}.${(_selectedStartDay??DateTime.now()).day} ~ ${(_selectedEndDay??DateTime.now()).year}.${(_selectedEndDay??DateTime.now()).month}.${(_selectedEndDay??DateTime.now()).day}";
  }
  @override
  Widget build(BuildContext context) {
    final statusHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: statusHeight, left: 20.0, right: 20.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
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
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 18.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.white;
                }),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.white;
                }),
              ),
              onPressed: () {},
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
            SizedBox(
              height: 36.0,
            ),
            Text(
              "날짜",
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
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
            SizedBox(height: 24.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  child: Text(getDate(), style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
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
            SizedBox(height: 36.0,),
            OutlinedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "매칭하기",
                    style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.resolveWith((states) {
                  return Size(double.infinity, 48.0);
                }),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return Color(0xff87360C);
                }),
                foregroundColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.white;
                }),
              ),
            ),
            SizedBox(height: 100.0,),
          ],
        ),
      ),
    );
  }
}
