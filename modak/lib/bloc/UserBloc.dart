import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/UserEvent.dart';
import 'package:modak/bloc/UserState.dart';
import 'package:modak/dto/User.dart';
import 'package:modak/repository/UserRepository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc({required this.repository}) : super(Empty());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is SelectUserEvent) {
      yield* _mapSelectUserEvent(event);
    }
  }

  Stream<UserState> _mapSelectUserEvent(SelectUserEvent event) async* {
    try {
      yield Loading();

      var user = await this.repository.selectUser();
      print(user);
      yield Loaded(user: User.fromJson(user));

    } catch (e) {
      yield Error(message: e.toString());
    }
  }

}