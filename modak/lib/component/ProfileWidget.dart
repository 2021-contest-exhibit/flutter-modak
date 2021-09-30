import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modak/dto/User.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: ProfileWidget(
          user: User("ysy3350", 10),
        ),
      ),
    ),
  ));
}

class ProfileWidget extends StatefulWidget {
  User user;

  ProfileWidget({required this.user});

  @override
  ProfileWidgetState createState() => ProfileWidgetState();
}

class ProfileWidgetState extends State<ProfileWidget> {

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(left: 180.0, right: 5.0, top: 5.0, bottom: 5.0),
              child: Column(
                children: [
                  Visibility(
                    visible: widget.user != null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.all(6.0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 4,),
                          Text(widget.user.userid, style: const TextStyle(fontSize: 28.0),),
                          const SizedBox(height: 4,),
                          Text('Lv. ${widget.user.level.toString()}', style: const TextStyle(fontSize: 18.0, color: Color(0xff87360C)),)
                        ],
                      )
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0x2087360C),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
          Positioned(
            left: 20.0,
            top: 30.0,
            bottom: 30.0,
            child: Container(
              width: 160,
              child: Icon(Icons.person_outline, size: 64,),
              decoration: BoxDecoration(
                color: Colors.white,
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