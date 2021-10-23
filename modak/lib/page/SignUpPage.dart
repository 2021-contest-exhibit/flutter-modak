import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/UserBloc.dart';
import 'package:modak/bloc/UserEvent.dart';
import 'package:modak/bloc/UserState.dart';

void main() {
  runApp(
    MaterialApp(
      home: SignUpPage(),
    ),
  );
}

class SignUpPage extends StatefulWidget {
  var _emailTextController = TextEditingController();
  var _password1TextController = TextEditingController();
  var _password2TextController = TextEditingController();

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 92.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'image/logo_black.png',
                        width: 48.0,
                        height: 48.0,
                      ),
                      Text(
                        "Modak",
                        style: TextStyle(
                            fontSize: 36.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 48.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                padding: const EdgeInsets.all(8.0),
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
                child: TextField(
                  controller: widget._emailTextController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    hintText: '이메일을 입력해주세요.',
                    hintStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                padding: const EdgeInsets.all(8.0),
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
                child: TextField(
                  controller: widget._password1TextController,
                  obscureText: true,
                  obscuringCharacter: "*",
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    hintText: '비밀번호를 입력해주세요.',
                    hintStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                padding: const EdgeInsets.all(8.0),
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
                child: TextField(
                  controller: widget._password2TextController,
                  obscureText: true,
                  obscuringCharacter: "*",
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    hintText: '비밀번호를 입력해주세요.',
                    hintStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: OutlinedButton(
                  onPressed: () async {
                    if (widget._emailTextController.text == "") {
                      return;
                    }
                    if (widget._password1TextController.text == "") {
                      return;
                    }
                    if (widget._password2TextController.text == "") {
                      return;
                    }
                    if (widget._password1TextController.text !=
                        widget._password2TextController.text) {
                      return;
                    }
                    BlocProvider.of<UserBloc>(context).add(SignUpUserEvent(
                        email: widget._emailTextController.text,
                        password: widget._password2TextController.text));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "회원가입",
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
              ),
              const SizedBox(
                height: 36.0,
              ),
            ],
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (_, state) {
              if (state is Loading) {
                return Container(
                  color: Color(0x44232323),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return Container();
            },
            buildWhen: (previous, current) {
              if (current is SignUpSuccessed) {
                Navigator.pop(context);
              }
              return true;
            },
          ),
        ],
      ),
    );
  }
}
