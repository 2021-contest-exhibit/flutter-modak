
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/ModakEvent.dart';
import 'package:modak/bloc/ModakState.dart';
import 'package:modak/dto/Matching.dart';
import 'package:modak/repository/APIRepository.dart';
import 'package:modak/repository/FireStoreRepository.dart';
import 'package:modak/repository/UserRepository.dart';
import 'package:modak/rest/ResponseGetCampings.dart';

class ModakBloc extends Bloc<ModakEvent, ModakState> {
  final FireStoreRepository fireStoreRepository;
  final UserRepository userRepository;
  final APIRepository apiRepository;
  ModakBloc({required this.fireStoreRepository, required this.userRepository, required this.apiRepository}) : super(Empty());

  @override
  Stream<ModakState> mapEventToState(ModakEvent event) async* {
    if (event is CreateMatchingEvent) {
      yield* _mapCreateMatchingEvent(event);
    } else if (event is LoadMatchingEvent) {
      yield* _mapLoadMatchingEvent(event);
    }
  }

  Stream<ModakState>_mapCreateMatchingEvent(CreateMatchingEvent event) async* {
    yield Loading();

    var token = userRepository.getUserToken();
    var email = userRepository.getUserEmail();

    var response = await fireStoreRepository.saveMatching(Matching.fromJson(event.matching.toJson()..["user"] = token..["email"] = email)).onError((error, stackTrace) {
      return null;
    });

    if (response != null) {
      yield Loaded();
    } else {
      yield Error(message: 'response null');
    }

  }

  Stream<ModakState> _mapLoadMatchingEvent(LoadMatchingEvent event) async* {
    yield Loading();

    var response = await fireStoreRepository.loadMatching().onError((error, stackTrace) => null);
    if (response != null) {
      response = await Stream.fromIterable(response).asyncMap((e) async {
        var camping = await apiRepository.getCampings(contentId: e.campingId);
        if (camping != null) {
          return Matching(campingId: e.campingId, startDate: e.startDate, endDate: e.endDate, createDate: e.createDate, content: camping.content[0], user: e.user, email: e.email);
        }
        return e;
      }).toList();
      yield MatchingLoaded(matchings: response);
    } else {
      yield Error(message: 'response null');
    }

    var uid = userRepository.getUserToken();
    if (uid != null) {
      var myResponse = await fireStoreRepository.loadMyMatching(uid).onError((error, stackTrace) => null);

      if (myResponse != null) {
        myResponse = await Stream.fromIterable(myResponse).asyncMap((e) async {
          var camping = await apiRepository.getCampings(contentId: e.campingId);
          if (camping != null) {
            return Matching(campingId: e.campingId, startDate: e.startDate, endDate: e.endDate, createDate: e.createDate, content: camping.content[0], user: e.user, email: e.email);
          }
          return e;
        }).toList();
        yield MatchingLoaded(myMatchings: myResponse);
      } else {
        yield Error(message: 'response null');
      }
    }

  }

}