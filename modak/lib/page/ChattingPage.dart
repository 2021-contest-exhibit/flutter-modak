import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final PagingController<int, ModakChat> _pagingController =
      PagingController(firstPageKey: 0);

  List<ModakChat> _chatList = [];
  DocumentSnapshot? lastDocumentSnapshot;

  @override
  ChattingPageState createState() => ChattingPageState();
}

class ChattingPageState extends State<ChattingPage> {
  final Stream<QuerySnapshot> _chattingStream = FirebaseFirestore.instance
      .collection('chattings')
      .where("matchingId", isEqualTo: "lHKC9XN6suYCNxQzFjJf")
      .orderBy("createDate", descending: true)
      .snapshots();

  Widget _ChatWidget(
      double maxSize, bool isMyMessage, String email, String message) {
    return Column(
      children: [
        SizedBox(
          height: 24.0,
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
          height: 24.0,
        ),
      ],
    );
  }

  @override
  void initState() {
    // BlocProvider.of<ModakBloc>(context).add(LoadChattingEvent(
    //     matchingId: "lHKC9XN6suYCNxQzFjJf",
    //     values: widget._chatList.map((e) => e.chat!).toList()));

    _chattingStream.listen((event) async {
      print(event.docs[0].data());

      List<ModakChat> list = [];

      for (int i = 0; i < event.docs.length; i++) {
        Chat _chat =
            Chat.fromJson(event.docs[i].data() as Map<String, dynamic>);
        print(_chat.toJson());

        ModakChat modakChat = await FirebaseFirestore.instance
            .collection('users')
            .where("uid", isEqualTo: _chat.userId)
            .get()
            .then((value) {
          print(value.docs[0]);
          ModakUser _user = ModakUser.fromJson(value.docs[0].data());
          return ModakChat(chat: _chat, modakUser: _user);
        });
        list.add(modakChat);
      }

      setState(() {
        widget._chatList = list;
      });
    });
    super.initState();
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
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: _height,
              child: Container(
                margin: const EdgeInsets.only(top: 24.0, bottom: 64.0),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  reverse: true,
                  itemCount: widget._chatList.length,
                  itemBuilder: (context, index) {
                    return _ChatWidget(
                        _width / 2 - 40,
                        false,
                        widget._chatList[index].modakUser!.email,
                        widget._chatList[index].chat!.message);
                  },
                ),
              ),
            ),
            Positioned(
              top: _statusHeight,
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
                          BlocProvider.of<ModakBloc>(context).add(
                              LoadChattingEvent(
                                  matchingId: "lHKC9XN6suYCNxQzFjJf",
                                  values: widget._chatList
                                      .map((e) => e.chat!)
                                      .toList()));
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
}
