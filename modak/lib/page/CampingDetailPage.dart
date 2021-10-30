import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/CampingAPIBloc.dart';
import 'package:modak/bloc/CampingAPIEvent.dart';
import 'package:modak/bloc/CampingAPIState.dart';
import 'package:modak/rest/Content.dart';
import 'package:modak/rest/ResponseGetCampings.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: CampingDetailPage(),
      ),
    ),
  ));
}

class CampingDetailPage extends StatefulWidget {
  final PageController _controller = new PageController(initialPage: 0);
  late Content args;
  int _currentPage = 0;

  @override
  CampingDetailPageState createState() => CampingDetailPageState();
}

class CampingDetailPageState extends State<CampingDetailPage> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    widget._controller.addListener(() {
      setState(() {
        widget._currentPage = widget.args.campingImages!.length > 0
            ? ((widget._controller.page ?? 0) + 1).toInt()
            : 0;
      });
    });
    print(widget.args.campingImages);
    return Scaffold(
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                pinned: false,
                stretch: true,
                expandedHeight: 360,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: <StretchMode>[
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                  ],
                  background: Container(
                    child: Stack(
                      children: [
                        PageView(
                          controller: widget._controller,
                          allowImplicitScrolling: true,
                          children: (widget.args.campingImages != null &&
                                  widget.args.campingImages!.length > 0)
                              ? widget.args.campingImages!.map<Widget>((e) {
                                  return Image.network(
                                    e.imageUrl,
                                    height: 388,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress != null) {
                                        return Container(
                                          color: Colors.white,
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        );
                                      }
                                      return child;
                                    },
                                  );
                                }).toList()
                              : [
                                  Container(
                                    height: 288,
                                    color: Colors.white,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'image/logo_black.png',
                                            width: 36.0,
                                            height: 36.0,
                                          ),
                                          Text(
                                            "등록된 이미지가 없습니다.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                        ),
                        Positioned(
                          bottom: 12.0,
                          left: 12.0,
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "${widget._currentPage}/${widget.args.campingImages!.length}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                                color: Color(0x662F2F2F)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xffF2F2F2),
            boxShadow: [
              BoxShadow(
                  color: Color(0x22000000),
                  offset: Offset(-10, -10),
                  spreadRadius: 0,
                  blurRadius: 10),
              BoxShadow(
                  color: Color(0x11000000),
                  offset: Offset(10, 10),
                  spreadRadius: 0,
                  blurRadius: 10)
            ],
          ),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: AutoSizeText(
                            widget.args.name!,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'NotoSansKR'),
                          ),
                          width: _width - 40,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: BlocBuilder<CampingAPIBloc, CampingAPIState>(
                      builder: (_, state) {
                        if (state is CampingLoaded) {
                          print("isgood: ${state.campings[0].isGoodByUser}");
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (state.campings[0].isGoodByUser ?? false) {
                                    BlocProvider.of<CampingAPIBloc>(context)
                                        .add(DeleteCampingGoodsEvent(
                                            campingId: widget.args.contentId));
                                  } else {
                                    BlocProvider.of<CampingAPIBloc>(context)
                                        .add(GetCampingGoodsEvent(
                                            campingId: widget.args.contentId));
                                  }

                                  BlocProvider.of<CampingAPIBloc>(context).add(
                                      GetCampingEvent(
                                          contentId: widget.args.contentId));
                                },
                                child: Icon(
                                  state.campings[0].isGoodByUser ?? false
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                "${state.campings[0].goodCount}",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          );
                        }
                        return SizedBox(
                          height: 24.0,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    width: _width,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: Wrap(
                            children: widget.args.facilities!
                                .split(",")
                                .map<Widget>((e) {
                              return Container(
                                margin: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                child: Text(
                                  e,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "주소",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 12.0,
                            ),
                            Flexible(
                              child: Text(
                                widget.args.addr!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Visibility(
                          visible: widget.args.phoneNumber != null &&
                              widget.args.phoneNumber != "",
                          child: Row(
                            children: [
                              Text(
                                "문의처",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Visibility(
                          visible: widget.args.phoneNumber != null &&
                              widget.args.phoneNumber != "",
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 12.0,
                                  ),
                                  Icon(Icons.call),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      print(widget.args.phoneNumber!);
                                      if (await canLaunch(
                                          'tel: ${widget.args.phoneNumber!}')) {
                                        await launch(
                                            'tel: ${widget.args.phoneNumber}');
                                      } else {
                                        print("지원하지 않습니다");
                                      }
                                    },
                                    child: Text(
                                      widget.args.phoneNumber!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.lightBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 24.0,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          (widget.args.longDescription ?? ""),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    widget.args = ModalRoute.of(context)!.settings.arguments as Content;
    BlocProvider.of<CampingAPIBloc>(context)
        .add(GetCampingEvent(contentId: widget.args.contentId));
    widget._currentPage = widget.args.campingImages!.length > 0 ? 1 : 0;
  }
}
