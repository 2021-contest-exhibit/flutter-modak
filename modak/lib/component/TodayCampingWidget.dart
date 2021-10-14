import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/CampingAPIBloc.dart';
import 'package:modak/bloc/CampingAPIEvent.dart';
import 'package:modak/bloc/CampingAPIState.dart';
import 'package:modak/dto/Camping.dart';
import 'package:modak/rest/ResponseGetCampings.dart';

class TodayCompingWidget extends StatefulWidget {
  List<Camping> recipeList;

  TodayCompingWidget({required this.recipeList});

  @override
  _TodayCompingWidgetState createState() => _TodayCompingWidgetState();
}

class _TodayCompingWidgetState extends State<TodayCompingWidget> {



  Widget _campingItemWidget(index, Content content) {
    return Container(
      width: 140,
      height: 180,
      margin: const EdgeInsets.only(right: 24.0, top: 12.0, bottom: 12.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/camping_detail', arguments: content);
        },
        child: Ink(
          width: 120,
          height: 180,
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: const BorderRadius.all(
              const Radius.circular(15.0),
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
          child: Column(
            children: [
              Container(
                width: 140,
                height: 174,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
                  child: (content.campingImages != null && content.campingImages!.length > 0) ? Image.network(
                    content.campingImages![0].imageUrl,
                    fit: BoxFit.fitHeight,
                  ) : Center(child: Image.asset('image/logo_black.png',width: 48.0, height: 48.0,)),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0),
                    bottomRight: const Radius.circular(15.0),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: 124,
                      child: AutoSizeText(
                        content.name??"",
                        minFontSize: 4.0,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0
                        ),
                      ),
                    ),
                    const SizedBox(height: 2.0,),
                    Text(
                      content.shortDescription!,
                      maxLines: 1,
                      style: const TextStyle(
                        color: const Color(0xff8f8f8f),
                        fontSize: 8.0,
                      ),
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
    return Container(
      height: 246,
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<CampingAPIBloc, CampingAPIState>(
              builder: (context, state) {
                if (state is TodayCampingsLoaded) {
                  return ListView.builder(
                    itemCount: state.campings.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return _campingItemWidget(index, state.campings[index]);
                    },
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<CampingAPIBloc>(context).add(
      GetTodayCampingsEvent()
    );
  }
}
