
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/ModakEvent.dart';
import 'package:modak/bloc/ModakState.dart';
import 'package:modak/dto/Matching.dart';
import 'package:modak/repository/FireStoreRepository.dart';
import 'package:modak/repository/UserRepository.dart';

class ModakBloc extends Bloc<ModakEvent, ModakState> {
  final FireStoreRepository fireStoreRepository;
  final UserRepository userRepository;
  ModakBloc({required this.fireStoreRepository, required this.userRepository}) : super(Empty());

  @override
  Stream<ModakState> mapEventToState(ModakEvent event) async* {
    if (event is CreateMatchingEvent) {
      yield* _mapCreateMatching(event);
    }
  }

  Stream<ModakState>_mapCreateMatching(CreateMatchingEvent event) async* {
    yield Loading();

    var token = userRepository.getUserToken();

    var response = await fireStoreRepository.saveMatching(Matching.fromJson(event.matching.toJson()..["user"] = token)).onError((error, stackTrace) {
      return null;
    });

    if (response != null) {
      yield Loaded();
    } else {
      yield Error();
    }

  }

}