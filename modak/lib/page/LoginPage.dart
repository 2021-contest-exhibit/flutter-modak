import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/UserBloc.dart';
import 'package:modak/bloc/UserEvent.dart';
import 'package:modak/bloc/UserState.dart';
import 'package:modak/dto/SavedUser.dart';

void main() {
  runApp(
    MaterialApp(
      home: LoginPage(),
    ),
  );
}

class LoginPage extends StatefulWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    style:
                        TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
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
              controller: widget._emailController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
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
              controller: widget._passwordController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
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
            height: 36.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: OutlinedButton(
              onPressed: () async{
                print("button click");
                BlocProvider.of<UserBloc>(context).add(
                  LoginUserEvent(
                      user: SavedUser(
                    email: widget._emailController.text,
                    password: widget._passwordController.text,
                  )),
                );
                await BlocProvider.of<UserBloc>(context).stream.map((state) {
                  print("state: ${state}");
                  if (state is Empty) {
                  }else if (state is Loading){
                    print("loading");
                  }else if (state is Error) {
                    print("error");
                  }else if (state is Loaded) {
                    Navigator.pop(context);
                  }
                }).last;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "로그인",
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
          ),
          const SizedBox(
            height: 36.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Center(
                  child: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith((states) {
                    return Colors.white;
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    return Colors.white;
                  }),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Center(
                  child: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith((states) {
                    return Colors.white;
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    return Colors.white;
                  }),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Center(
                  child: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith((states) {
                    return Colors.white;
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    return Colors.white;
                  }),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6.0,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "회원가입",
                style: TextStyle(color: Color(0xff87360C)),
              ))
        ],
      ),
    );
  }

}
