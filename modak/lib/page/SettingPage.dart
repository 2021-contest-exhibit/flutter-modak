import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/ModakBloc.dart';
import 'package:modak/bloc/UserBloc.dart';
import 'package:modak/bloc/UserEvent.dart';
import 'package:modak/bloc/UserState.dart';
import 'package:modak/component/ProfileWidget.dart';
import 'package:modak/dto/ModakUser.dart';
import 'package:modak/repository/UserRepository.dart';

void main() {
  runApp(
    MaterialApp(
      home: SettingPage(),
    ),
  );
}

class SettingPage extends StatefulWidget {
  @override
  SettingPageState createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  Widget _menuButton(Icon icon, String title, GestureTapCallback event) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: event,
        child: Ink(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [icon],
                ),
              ),
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansCJkr',
                  ),
                ),
              )
            ],
          ),
          decoration: const BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x22000000),
                  offset: Offset(2.0, 2.0),
                  blurRadius: 2.0,
                  spreadRadius: 0.1,
                ),
              ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(
      CheckUserEvent(),
    );
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Container(
            height: 220,
            child: BlocBuilder<UserBloc, UserState>(
              builder: (_, state) {
                if (state is Loading) {
                  return Center(child: CircularProgressIndicator());
                }
                return ProfileWidget(
                    user: state is Loaded ? state.user : null);
              },
              buildWhen: (previous, current) {
                if (current is Error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(current.message)));
                }
                return true;
              },
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          _menuButton(
              Icon(
                Icons.campaign,
                color: Colors.black,
                size: 28,
              ),
              "공지사항", () {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('아직 지원하지 않는 기능입니다.'),
              duration: Duration(milliseconds: 500),
            ));
          }),
          const SizedBox(
            height: 20.0,
          ),
          _menuButton(
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 28,
              ),
              "좋아요", () {
            Navigator.pushNamed(context, '/goods');
          }),
          const SizedBox(
            height: 20.0,
          ),
          _menuButton(
              Icon(
                Icons.settings,
                color: Colors.grey,
                size: 28,
              ),
              "설정", () {
            Navigator.pushNamed(context, '/setting_detail');
          }),
          const SizedBox(
            height: 20.0,
          ),
          _menuButton(
              Icon(
                Icons.info,
                size: 28,
              ),
              "버전정보", () {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('V1.0.0'),
              duration: Duration(milliseconds: 500),
            ));
          }),
          const SizedBox(
            height: 120,
          ),
        ],
      ),
    );
  }
}
