import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/UserBloc.dart';
import 'package:modak/bloc/UserEvent.dart';
import 'package:modak/bloc/UserState.dart';

class SettingDetailPage extends StatefulWidget {
  @override
  SettingDetailPageState createState() => SettingDetailPageState();
}

class SettingDetailPageState extends State<SettingDetailPage> {
  @override
  Widget build(BuildContext context) {
    final _statusHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        TextEditingController controller = TextEditingController();
                        return AlertDialog(
                          title: Text('닉네임 변경'),
                          content: TextField(controller: controller,),
                          actions: [
                            TextButton(
                              onPressed: () {
                                BlocProvider.of<UserBloc>(context).add(
                                  UpdateNicknameEvent(nickname: controller.text)
                                );
                                BlocProvider.of<UserBloc>(context).add(
                                  CheckUserEvent(),
                                );
                                Navigator.pop(context);
                              },
                              child: Text('변경'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 12.0),
                    child: Row(
                      children: [
                        Text(
                          '닉네임 설정하기',
                          style: TextStyle(fontSize: 24.0),
                        )
                      ],
                    ),
                  ),
                ),
                Divider()
              ],
            ),
          ),
          Center(
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is NicknameUpdateError) {
                  Text(state.message);
                }
                return Container();
              },
              buildWhen: (previous, current) {
                if (current is NicknameUpdating) {
                  return true;
                } else if (current is NicknameUpdateError) {
                  print('error: ${current.message}');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(current.message),
                    duration: Duration(milliseconds: 1000),
                  ));
                }
                return false;
              },
            ),
          )
        ],
      ),
    );
  }
}
