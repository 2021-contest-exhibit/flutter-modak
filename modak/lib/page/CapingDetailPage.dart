import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/CampingAPIBloc.dart';
import 'package:modak/bloc/CampingAPIEvent.dart';
import 'package:modak/bloc/CampingAPIState.dart';
import 'package:modak/rest/Content.dart';
import 'package:modak/rest/ResponseGetCampings.dart';

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
  late var args;
  int _currentPage = 1;

  @override
  CampingDetailPageState createState() => CampingDetailPageState();
}

class CampingDetailPageState extends State<CampingDetailPage> {


  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    widget._controller.addListener(() {
      setState(() {
        widget._currentPage = ((widget._controller.page ?? 1) + 1).toInt();
      });
    });
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 388,
            child: Stack(
              children: [
                PageView(
                  controller: widget._controller,
                  children: widget.args.campingImages!.map<Widget>((e) {
                    return Image.network(
                      e.imageUrl,
                      height: 388,
                      fit: BoxFit.fitHeight,
                    );
                  }).toList(),
                ),
                Positioned(
                  bottom: 12.0,
                  left: 12.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "${widget._currentPage}/${widget.args.campingImages!.length}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        color: Color(0x662F2F2F)),
                  ),
                ),
                Positioned(
                  top: 12.0,
                  left: 12.0,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: AutoSizeText(
                    widget.args.name!,
                    maxLines: 1,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
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
                            BlocProvider.of<CampingAPIBloc>(context).add(
                                DeleteCampingGoodsEvent(
                                    campingId: widget.args.contentId));
                          } else {
                            BlocProvider.of<CampingAPIBloc>(context).add(
                                GetCampingGoodsEvent(
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
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [CircularProgressIndicator()],
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
                    children:
                        widget.args.facilities!.split(",").map<Widget>((e) {
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Text(
                          e,
                          maxLines: 1,
                          style: TextStyle(color: Colors.white),
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
                Row(
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
                SizedBox(
                  height: 4.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      widget.args.phoneNumber!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
                Text(
                  widget.args.longDescription ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    widget.args = ModalRoute.of(context)!.settings.arguments as Content;
    BlocProvider.of<CampingAPIBloc>(context)
        .add(GetCampingEvent(contentId: widget.args.contentId));
  }
}
