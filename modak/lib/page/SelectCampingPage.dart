import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/CampingAPIBloc.dart';
import 'package:modak/bloc/CampingAPIEvent.dart';
import 'package:modak/bloc/CampingAPIState.dart';
import 'package:modak/bloc/ModakBloc.dart';
import 'package:modak/bloc/ModakEvent.dart';
import 'package:modak/rest/Content.dart';

class SelectCampingPage extends StatefulWidget {
  @override
  SelectCampingPageState createState() => SelectCampingPageState();
}

class SelectCampingPageState extends State<SelectCampingPage> {

  final textEditingController = TextEditingController();

  Widget _campingItemWidget(Content camping) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 18.0),
      child: InkWell(
        onTap: () {
          BlocProvider.of<ModakBloc>(context).add(
              CampingSelectedEvent(content: camping)
          );
          Navigator.pop(context);
        },
        child: Ink(
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
              ]
          ),
          child: Row(
            children: [
              Container(
                width: (_width-40) * 45/100,
                height: 150.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), bottomLeft: Radius.circular(5.0)),
                  child: (camping.thumbnailImageUrl != null &&camping.thumbnailImageUrl != "") ? Image.network(
                    camping.thumbnailImageUrl!,
                    fit: BoxFit.fitHeight,
                  ) : Center(child: Image.asset('image/logo_black.png',width: 36.0, height: 36.0,)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 6, left: 24, right: 24),
                width: (_width-40) * 55/100,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0,),
                    AutoSizeText(
                      camping.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: const Color(0xff000000),
                        fontSize: 18.0,
                        fontFamily: 'Shilla_Gothic',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12.0,),
                    Flexible(
                      child: Text(
                        camping.addr!,
                        maxLines: 2,
                        style: const TextStyle(
                          color: const Color(0xff8f8f8f),
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.favorite, color: Colors.red, size: 18.0,),
                        const SizedBox(width: 2.0,),
                        Text(
                            "${camping.goodCount??0}"
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 48.0, left: 20.0, right: 20.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Hero(
              tag: 'select_camping',
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith((states) {
                    return Colors.white;
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    return Colors.white;
                  }),
                  padding: MaterialStateProperty.resolveWith((states) {
                    return EdgeInsets.all(0);
                  }),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      width: _width - 40 - 48,
                      child: TextField(
                        controller: textEditingController,
                        autofocus: true,
                        onSubmitted: (value) {
                          BlocProvider.of<CampingAPIBloc>(context).add(
                              GetCampingsEvent(nameContains: value, regionMap: {}, operationTypeMap: {}, environmentMap: {})
                          );
                        },
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'NotoSansKR',
                        ),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: '검색어를 입력해주세요',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontFamily: 'NotoSansKR',
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
                      icon: Icon(Icons.search),
                      color: Colors.black,
                      onPressed: () {
                        BlocProvider.of<CampingAPIBloc>(context).add(
                          GetCampingsEvent(nameContains: textEditingController.text, regionMap: {}, operationTypeMap: {}, environmentMap: {})
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<CampingAPIBloc, CampingAPIState>(
              builder: (context, state) {
                if (state is CampingsLoaded) {
                  return Column(
                    children: state.content.map((e) {
                      return _campingItemWidget(e);
                    }).toList(),
                  );
                } else if (state is SearchLoading) {
                  return CircularProgressIndicator();
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
