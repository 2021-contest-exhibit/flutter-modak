import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/UserBloc.dart';
import 'package:modak/bloc/UserEvent.dart';
import 'package:modak/dto/ModakUser.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: ProfileWidget(
          user: ModakUser(email: "ysy3350", uid: "",image: "", level: 1, nickname: ""),
        ),
      ),
    ),
  ));
}

class ProfileWidget extends StatefulWidget {
  ModakUser? user;

  ProfileWidget({this.user});

  @override
  ProfileWidgetState createState() => ProfileWidgetState();
}

class ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      height: 220,
      child: Stack(
        children: [
          Positioned(
            left: 20.0,
            right: 20.0,
            top: 48.0,
            bottom: 48.0,
            child: Container(
              padding: EdgeInsets.only(
                  left: (_width-10) * 40 / 100, right: 5.0, top: 5.0, bottom: 5.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: widget.user != null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: (_width-10) * 40 / 100,
                              child: AutoSizeText(
                                (widget.user != null
                                    ? (widget.user!.nickname != "" ? widget.user!.nickname : widget.user!.email)
                                    : ""),
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 28.0, fontFamily: 'NotoSansCJkr', fontWeight: FontWeight.bold),
                                minFontSize: 8.0,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              width: (_width-10) * 15 / 100,
                              child: AutoSizeText(
                                'Lv. ${widget.user != null ? widget.user!.level.toString() : "0"}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 18.0, color: Theme.of(context).primaryColor, fontFamily: 'NotoSansCJkr', fontWeight: FontWeight.bold),
                                minFontSize: 12.0,
                                maxLines: 1,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: widget.user == null,
                    child: Column(
                      children: [
                        Container(
                          width: 120.0,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "로그인",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            style: ButtonStyle(
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
                        ),
                      ],
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0x20363636),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
          Positioned(
            right: 24.0,
            top: 52.0,
            child: Visibility(
              visible: widget.user != null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top:6, right: 6),
                      child: Icon(
                        Icons.logout,
                        size: 18,
                      ),
                    ),
                    onTap: () {
                      BlocProvider.of<UserBloc>(context).add(
                        LogoutUserEvent(),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 20.0,
            top: 35.0,
            bottom: 35.0,
            child: Container(
              width: (_width-10) * 42 / 100,
              height: (_width-10) * 42 / 100,
              child: Icon(
                Icons.person,
                size: 72,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 18, 32, 47),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x55efefef),
                      offset: Offset(2.0, 2.0),
                      blurRadius: 10.0,
                      spreadRadius: 5.0)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
