
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/ModakEvent.dart';
import 'package:modak/bloc/ModakState.dart';
import 'package:modak/dto/Matching.dart';
import 'package:modak/dto/ModakMatching.dart';
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

    if (token != null) {
      var response = await fireStoreRepository.saveMatching(
          Matching(
              user: token,
              campingId: event.campingId,
              startDate: event.startDate,
              endDate: event.endDate,
              createDate: event.createDate,
              userList: [token]
          )
      );
      if (response != null) {
        yield Loaded();
      } else {
        yield Error(message: '매칭 생성에 실패하였습니다.');
      }
    } else {
      yield Error(message: "로그인이 필요한 서비스 입니다.");
    }

  }

  Stream<ModakState> _mapLoadMatchingEvent(LoadMatchingEvent event) async* {
    yield Loading();

    var uid = userRepository.getUserToken();
    var email = userRepository.getUserEmail();
    var response = await fireStoreRepository.loadMatching().onError((error, stackTrace) => null);

    if (response != null && uid != null && email != null) {
      var matchings = await Stream.fromIterable(response).asyncMap((e) async {
        var campings = await apiRepository.getCampings(contentId: e[e.keys.first]!.campingId);
        return ModakMatching(matching: e[e.keys.first], content: campings!.content[0], email: email, uid: uid, matchingId: e.keys.first);
      }).toList();
      yield MatchingLoaded(matchings: matchings);
    } else {
      yield Error(message: 'response null');
    }
  }

}