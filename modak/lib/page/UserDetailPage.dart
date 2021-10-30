import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/UserBloc.dart';
import 'package:modak/bloc/UserState.dart';
import 'package:modak/dto/ModakUser.dart';

class UserDetailPage extends StatefulWidget {
  ModakUser? user;

  @override
  UserDetailPageState createState() => UserDetailPageState();
}

class UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    final _statusHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              pinned: false,
              stretch: true,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                ],
                background: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: _statusHeight),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(24.0),
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
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 128,
                            width: 128,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 18, 32, 47),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: widget.user != null &&
                                    widget.user!.image != ""
                                ? ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.network(
                                      widget.user!.image,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Icon(
                                    Icons.person,
                                    size: 72,
                                    color: Colors.white,
                                  ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.user!.nickname != ""
                                ? widget.user!.nickname
                                : widget.user!.email,
                            style: TextStyle(
                                fontSize: 36, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ];
      },
      body: Container(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "이메일",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${widget.user!.email}",
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Divider(
                thickness: 1.0,
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "레벨",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${widget.user!.level}",
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Divider(
                thickness: 1.0,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void didChangeDependencies() {
    widget.user = ModalRoute.of(context)!.settings.arguments as ModakUser;
  }
}
