
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/CampingAPIEvent.dart';
import 'package:modak/bloc/CampingAPIState.dart';
import 'package:modak/repository/APIRepository.dart';

class CampingAPIBloc extends Bloc<CampingAPIEvent, CampingAPIState> {
  final APIRepository apiRepository;

  CampingAPIBloc({required this.apiRepository}): super(Empty());

  @override
  Stream<CampingAPIState> mapEventToState(CampingAPIEvent event) async*{
    if (event is GetCampingsEvent) {
      yield* _mapGetCampingsEvent(event);
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
}