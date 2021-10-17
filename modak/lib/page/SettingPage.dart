import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  void initState() {
    BlocProvider.of<UserBloc>(context).add(
      CheckUserEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 40.0,
          ),
          Container(
            height: 220,
            child: BlocBuilder<UserBloc, UserState>(
              builder: (_, state) {
                if (state is Loading) {
                  return Center(child: CircularProgressIndicator());
                }
                return ProfileWidget(user: state is Loaded ? state.user : null);
              },
              buildWhen: (previous, current) {
                if (current is Error) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(current.message)));
                }
                return true;
              },
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          _menuButton(Icon(Icons.campaign), "공지사항", () {}),
          const SizedBox(
            height: 20.0,
          ),
          _menuButton(Icon(Icons.favorite), "좋아요", () {
            Navigator.pushNamed(context, '/goods');
          }),
          const SizedBox(
            height: 20.0,
          ),
          _menuButton(Icon(Icons.settings), "설정", () {}),
          const SizedBox(
            height: 20.0,
          ),
          _menuButton(Icon(Icons.info), "버전정보", () {}),
          const SizedBox(
            height: 120,
          ),
        ],
      ),
    );
  }
}
