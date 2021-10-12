import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/UserEvent.dart';
import 'package:modak/bloc/UserState.dart';
import 'package:modak/dto/ModakUser.dart';
import 'package:modak/repository/DBRepository.dart';
import 'package:modak/repository/UserRepository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  final DBRepository dbRepository;

  UserBloc({required this.userRepository, required this.dbRepository}) : super(Empty());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is SelectUserEvent) {
      yield* _mapSelectUserEvent(event);
    } else if (event is LoginUserEvent) {
      yield* _mapLoginUserEvent(event);
    } else if (event is LogoutUserEvent) {
      yield* _mapLogoutUserEvent(event);
    } else if (event is CheckUserEvent) {
      yield* _mapCheckUserEvent(event);
    }
  }

  Stream<UserState> _mapLogoutUserEvent(LogoutUserEvent event) async* {
    yield Loading();

    await this.dbRepository.deleteUser();

    await this.userRepository.logout();

    yield Loaded();
  }

  Stream<UserState> _mapCheckUserEvent(CheckUserEvent event) async*{
    yield Loading();

    var user = await this.dbRepository.loadUser();

    if (user != null && user.email != "" && user.password != ""){
      var loginedUser = await this.userRepository.login(user.email, user.password);
      yield Loaded(user: ModakUser.fromJson(loginedUser));
    } else {
      yield Loaded();
    }

  }

  Stream<UserState> _mapSelectUserEvent(SelectUserEvent event) async* {
  }

  Stream<UserState> _mapLoginUserEvent(LoginUserEvent event) async* {
    try {
      yield Loading();

      var user = await this.userRepository.login(event.user.email, event.user.password);

      await this.dbRepository.saveUser(event.user);

      if (user["userid"] != "" && user["level"] != "") {
        yield Loaded(user: ModakUser.fromJson(user));
      } else {
        yield Error(message: 'login fail');
      }

    } catch (e) {
      yield Error(message: e.toString());
    }
  }

}