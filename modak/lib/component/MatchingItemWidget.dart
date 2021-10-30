import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/ModakBloc.dart';
import 'package:modak/bloc/ModakEvent.dart';
import 'package:modak/bloc/ModakState.dart';
import 'package:modak/dto/ModakMatching.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: MatchingItemWidget(
          modakMatching: ModakMatching(),
        ),
      ),
    ),
  ));
}

class MatchingItemWidget extends StatefulWidget {
  final ModakMatching modakMatching;

  MatchingItemWidget({required this.modakMatching});

  @override
  MatchingItemWidgetState createState() => MatchingItemWidgetState();
}

class MatchingItemWidgetState extends State<MatchingItemWidget> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 36.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/user_detail', arguments: widget.modakMatching.user);
                },
                child: Container(
                  margin: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        child: widget.modakMatching.user != null && widget.modakMatching.user!.image != ""
                            ?
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Image.network(
                            widget.modakMatching.user!.image,
                            fit: BoxFit.cover,
                          ),
                        )
                            : Icon(
                                Icons.person,
                                size: 24,
                                color: Colors.white,
                              ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 18, 32, 47),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Text(
                        (widget.modakMatching.user != null &&
                            widget.modakMatching.user!.nickname != "")
                            ? widget.modakMatching.user!.nickname
                            : widget.modakMatching.email!,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              widget.modakMatching.content!.thumbnailImageUrl != null &&
                      widget.modakMatching.content!.thumbnailImageUrl != ""
                  ? Image.network(
                      widget.modakMatching.content!.thumbnailImageUrl!,
                      width: _width,
                      fit: BoxFit.fitWidth,
                    )
                  : Container(
                      height: 120.0,
                      child: Image.asset(
                        'image/logo_black.png',
                        width: 36.0,
                        height: 36.0,
                      )),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.modakMatching.content!.name!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              fontFamily: 'NotoSansKR'),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          "${widget.modakMatching.matching!.startDate.year}.${widget.modakMatching.matching!.startDate.month}.${widget.modakMatching.matching!.startDate.day} ~ ${widget.modakMatching.matching!.endDate.year}.${widget.modakMatching.matching!.endDate.month}.${widget.modakMatching.matching!.endDate.day}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: () {
                        print('onpressed');
                        BlocProvider.of<ModakBloc>(context).add(
                            LoadIsJoinMatchingEvent(
                                matchingId: widget.modakMatching.matchingId!));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat_outlined,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "참여하기",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'NotoSansKR'),
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
                        padding: MaterialStateProperty.resolveWith((states) {
                          return EdgeInsets.symmetric(horizontal: 8.0);
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x22000000),
                  offset: Offset(-5, -5),
                  spreadRadius: 0,
                  blurRadius: 5),
              BoxShadow(
                  color: Color(0x11000000),
                  offset: Offset(5, 5),
                  spreadRadius: 0,
                  blurRadius: 10)
            ],
          ),
        ),
        BlocBuilder<ModakBloc, ModakState>(
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
            print('state: ${current}');
            if (current is Error) {
              print("error");
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(current.message),
                duration: Duration(milliseconds: 500),
              ));
            } else if (current is IsJoinMatchingLoaded &&
                current.matchingId == widget.modakMatching.matchingId) {
              if (current.isJoinMatching) {
                print(
                    'current: ${current.isJoinMatching}, ${current.matchingId}');
                print('before: ${previous}');
                Navigator.pushNamed(context, "/chatting",
                    arguments: widget.modakMatching.matchingId);
              } else {
                Navigator.pushNamed(context, "/payment",
                    arguments: widget.modakMatching);
              }
              return false;
            }
            return true;
          },
        )
      ],
    );
  }
}
