
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/CampingAPIEvent.dart';
import 'package:modak/bloc/CampingAPIState.dart';
import 'package:modak/repository/APIRepository.dart';
import 'package:modak/repository/UserRepository.dart';
import 'package:modak/rest/ResponseGetCampings.dart';

class CampingAPIBloc extends Bloc<CampingAPIEvent, CampingAPIState> {
  final APIRepository apiRepository;
  final UserRepository userRepository;

  CampingAPIBloc({required this.apiRepository, required this.userRepository}): super(Empty());

  @override
  Stream<CampingAPIState> mapEventToState(CampingAPIEvent event) async*{
    if (event is GetCampingsEvent) {
      yield* _mapGetCampingsEvent(event);
    } else if(event is GetCampingsEnvironmentsEvent) {
      yield* _mapGetCampingsEnvironmentsEvent(event);
    } else if(event is GetCampingsOperationTypesEvent) {
      yield* _mapGetCampingsOperationTypesEvent(event);
    } else if(event is GetCampingsRegionsEvent) {
      yield* _mapGetCampingsRegionsEvent(event);
    } else if(event is GetCampingsFilterDataEvent) {
      yield* _mapGetCampingsFilterDataEvent(event);
    } else if(event is GetTodayCampingsEvent) {
      yield* _mapGetTodayCampingsEvent(event);
    } else if (event is GetCampingFavoriteEvent) {
      yield* _mapGetUserFavoriteEvent(event);
    } else if (event is GetCampingGoodsEvent) {
      yield* _mapGetCampingGoodsEvent(event);
    }
  }

  Stream<CampingAPIState> _mapGetCampingsEvent(GetCampingsEvent event) async* {
    print("_mapGetCampingsEvent");
    yield Loading();

    var response = await apiRepository.getCampings().onError((error, stackTrace) {
      print(error.toString());
      print(stackTrace);
      return null;
    });

    if (response != null) {
      print("response: ${response.content[1].name}");
      yield Loaded();
    }else {
      print("error");
      yield Error();
    }
  }

  Stream<CampingAPIState> _mapGetCampingsFilterDataEvent(GetCampingsFilterDataEvent event) async* {
    print("_mapGetCampingsFilterDataEvent");
    yield Loading();

    var response1 = await apiRepository.getCampingsEnvironments().onError((error, stackTrace) {
      print(error.toString());
      print(stackTrace);
      return null;
    });

    var response2 = await apiRepository.getCampingsOperationTypes().onError((error, stackTrace) {
      print(error.toString());
      print(stackTrace);
      return null;
    });

    var response3 = await apiRepository.getCampingsRegions().onError((error, stackTrace) {
      print(error.toString());
      print(stackTrace);
      return null;
    });

    if (response1 != null && response2 != null && response3 != null) {
      print("response: ${response1.data} ${response2.data} ${response3.data}");
      yield Loaded(dataEnvironments:response1.data, dataOperationTypes: response2.data, dataRegions: response3.data);
    }else {
      print("error");
      yield Error();
    }
  }

  Stream<CampingAPIState> _mapGetCampingsEnvironmentsEvent(GetCampingsEnvironmentsEvent event) async* {
    print("_mapGetCampingsEnvironmentsEvent");
    yield Loading();

    var response = await apiRepository.getCampingsEnvironments().onError((error, stackTrace) {
      print(error.toString());
      print(stackTrace);
      return null;
    });

    if (response != null) {
      print("response: ${response.data}");
      yield Loaded(dataEnvironments:response.data);
    }else {
      print("error");
      yield Error();
    }
  }

  Stream<CampingAPIState> _mapGetCampingsOperationTypesEvent(GetCampingsOperationTypesEvent event) async* {
    print("_mapGetCampingsOperationTypesEvent");
    yield Loading();

    var response = await apiRepository.getCampingsOperationTypes().onError((error, stackTrace) {
      print(error.toString());
      print(stackTrace);
      return null;
    });

    if (response != null) {
      print("response: ${response.data}");
      yield Loaded(dataOperationTypes:response.data);
    }else {
      print("error");
      yield Error();
    }
  }

  Stream<CampingAPIState> _mapGetCampingsRegionsEvent(GetCampingsRegionsEvent event) async* {
    print("_mapGetCampingsRegionsEvent");
    yield Loading();

    var response = await apiRepository.getCampingsRegions().onError((error, stackTrace) {
      print(error.toString());
      print(stackTrace);
      return null;
    });

    if (response != null) {
      print("response: ${response.data}");
      yield Loaded(dataRegions:response.data);
    }else {
      print("error");
      yield Error();
    }
  }

  Stream<CampingAPIState> _mapGetTodayCampingsEvent(GetTodayCampingsEvent event) async* {
    var rnd = new Random();
    List<Content> list = [];
    for (; list.length < 3;) {
      var response = await apiRepository.getCampings(contentId: rnd.nextInt(1000));
      if (response != null && response.content.length > 0){
        list.add(response.content[0]);
      }
    }
    if (list.length > 0) {
      yield TodayCampingsLoaded(campings: list);
    }
  }

  Stream<CampingAPIState> _mapGetUserFavoriteEvent(GetCampingFavoriteEvent event) async*{
    yield Loading();

    await apiRepository.getUserFavorite("");

    yield CampingFavoriteLoaded(favorite: 10);
  }

  Stream<CampingAPIState> _mapGetCampingGoodsEvent(GetCampingGoodsEvent event) async* {
    yield Loading();

    var uid = await userRepository.getUserToken();
    if (uid != null) {
      await apiRepository.getGoods(event.campingId, uid);
    } else {
      yield Error();
    }
  }
}