import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:modak/bloc/ModakBloc.dart';
import 'package:modak/bloc/ModakEvent.dart';
import 'package:modak/bloc/ModakState.dart';
import 'package:modak/dto/Chat.dart';
import 'package:modak/dto/ModakChat.dart';
import 'package:modak/dto/ModakUser.dart';

class ChattingPage extends StatefulWidget {
  final scrollController = ScrollController();
  final textController = TextEditingController();
  bool isRequest = false;
  late String _matchingId;

  List<ModakChat> _chatList = [];
  DocumentSnapshot? lastDocumentSnapshot;

  @override
  ChattingPageState createState() => ChattingPageState();
}

class ChattingPageState extends State<ChattingPage> {
  final StreamController<List<ModakChat>> streamController =
      new StreamController<List<ModakChat>>();

  Widget _ChatWidget(
      double maxSize, bool isMyMessage, String email, String message) {
    return Column(
      children: [
        SizedBox(
          height: isMyMessage ? 12.0 : 24.0,
        ),
        Visibility(
          visible: !isMyMessage,
          child: Row(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                    color: Color(0xff3F3F3F),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              SizedBox(
                width: 4.0,
              ),
              Text(email),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment:
              isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 4.0,
            ),
            Container(
              width: maxSize,
              child: Row(
                mainAxisAlignment: isMyMessage
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: AutoSizeText(
                        message,
                        overflow: TextOverflow.fade,
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: isMyMessage ? 12.0 : 24.0,
        ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    widget._matchingId = ModalRoute.of(context)!.settings.arguments as String;
    print('================= ${widget._matchingId}');
    FirebaseFirestore.instance
        .collection('chattings')
        .where("matchingId", isEqualTo: widget._matchingId)
        .orderBy("createDate", descending: true)
        .snapshots()
        .listen((event) {
      event.docChanges.forEach((element) async {
        if (element.type == DocumentChangeType.added) {
          print("on changed");
          var _chat = Chat.fromJson(element.doc.data()!);
          print("changed :${_chat.toJson()}");

          await FirebaseFirestore.instance
              .collection("users")
              .where("uid", isEqualTo: _chat.userId)
              .get()
              .then(
            (value) {
              var _modakChat = ModakChat(
                  chat: _chat,
                  modakUser: ModakUser.fromJson(value.docs[0].data()));
              if (widget._chatList.length > 0) {
                if (widget._chatList[0].chat!.createDate
                    .isBefore(_modakChat.chat!.createDate)) {
                  widget._chatList.insert(0, _modakChat);
                  streamController.add(widget._chatList);
                }
              } else {
                widget._chatList.insert(0, _modakChat);
                streamController.add(widget._chatList);
              }
              requestNextPage();
            },
          );
        }
      });
    });
  }

  void requestNextPage() {
    if (!widget.isRequest) {
      setState(() {
        widget.isRequest = true;
      });
      print((widget._chatList.length > 0
          ? widget._chatList[widget._chatList.length - 1].chat!.createDate
              .toIso8601String()
          : DateTime.now().toIso8601String()));
      FirebaseFirestore.instance
          .collection('chattings')
          .where("matchingId", isEqualTo: widget._matchingId)
          .orderBy("createDate", descending: true)
          .startAfter([
            (widget._chatList.length > 0
                ? widget._chatList[widget._chatList.length - 1].chat!.createDate
                    .toIso8601String()
                : DateTime.now().toIso8601String())
          ])
          .limit(15)
          .get()
          .then(
            (value) {
              if (value.size < 1) {
                setState(() {
                  widget.isRequest = false;
                });
                return;
              }
              value.docs.forEach(
                (element) async {
                  print(element.data());
                  var _chat = Chat.fromJson(element.data());
                  final _modakChat = ModakChat(chat: _chat);
                  widget._chatList.add(_modakChat);
                  await FirebaseFirestore.instance
                      .collection("users")
                      .where("uid", isEqualTo: _chat.userId)
                      .get()
                      .then(
                    (value) {
                      var _modakUser = ModakUser.fromJson(value.docs[0].data());
                      var index = widget._chatList.indexWhere((element) {
                        return _modakChat.chat!.createDate ==
                            element.chat!.createDate;
                      });
                      print(index);
                      var _nModakChat = ModakChat(
                          chat: _modakChat.chat, modakUser: _modakUser);

                      print('user: ${_nModakChat.modakUser!.toJson()}');
                      widget._chatList[index] = _nModakChat;
                      print(
                          "modified: ${widget._chatList[index].modakUser!.toJson()}");

                      streamController.add(widget._chatList);
                      setState(() {
                        widget.isRequest = false;
                      });
                    },
                  );
                },
              );
            },
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final _statusHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.maxScrollExtent - 20 <
                    scrollInfo.metrics.pixels) {
                  requestNextPage();
                }
                return true;
              },
              child: Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: _height,
                child: Container(
                  margin: const EdgeInsets.only(top: 48.0, bottom: 64.0),
                  child: StreamBuilder(
                    builder:
                        (context, AsyncSnapshot<List<ModakChat>> snapshot) {
                      return StreamBuilder<List<ModakChat>>(
                        stream: streamController.stream,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container();
                          }
                          return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            reverse: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              var mUser = FirebaseAuth.instance.currentUser;
                              var _uid = mUser != null ? mUser.uid : "";

                              var chatUid =
                                  snapshot.data![index].modakUser != null
                                      ? snapshot.data![index].modakUser!.uid
                                      : "";
                              var chatName = snapshot.data![index].modakUser !=
                                      null
                                  ? (snapshot.data![index].modakUser!
                                              .nickname !=
                                          ""
                                      ? snapshot
                                          .data![index].modakUser!.nickname
                                      : snapshot.data![index].modakUser!.email)
                                  : "";
                              var chatEmail = mUser != null ? mUser.email : "";
                              return _ChatWidget(
                                  _width / 2 - 40,
                                  mUser != null ? chatUid == _uid : false,
                                  chatName,
                                  snapshot.data![index].chat!.message);
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              top: _statusHeight + 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    child: CircularProgressIndicator(),
                    visible: widget.isRequest,
                  )
                ],
              ),
            ),
            Positioned(
              top: _statusHeight + 20,
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
            Positioned(
              bottom: 12,
              child: Container(
                child: Row(
                  children: [
                    Container(
                      width: _width - 40 - 48,
                      child: TextField(
                        controller: widget.textController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                          hintText: '',
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
                    IconButton(
                        onPressed: () {
                          if (widget.textController.text != "") {
                            BlocProvider.of<ModakBloc>(context).add(
                                PushMessageEvent(
                                    matchingId: widget._matchingId,
                                    message: widget.textController.text));
                            widget.textController.text = "";
                          }
                        },
                        icon: Icon(Icons.send)),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
}
