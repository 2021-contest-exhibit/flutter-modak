import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/CampingAPIBloc.dart';
import 'package:modak/bloc/UserEvent.dart';
import 'package:modak/bloc/UserState.dart';
import 'package:modak/dto/ModakUser.dart';
import 'package:modak/repository/APIRepository.dart';
import 'package:modak/repository/DBRepository.dart';
import 'package:modak/repository/FireStoreRepository.dart';
import 'package:modak/repository/UserRepository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  final DBRepository dbRepository;
  final FireStoreRepository fireStoreRepository;
  final APIRepository apiRepository;

  UserBloc({required this.userRepository, required this.dbRepository, required this.fireStoreRepository, required this.apiRepository}) : super(Empty());

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
    } else if (event is SignUpUserEvent) {
      yield* _mapSignUpEvent(event);
    } else if (event is UpdateNicknameEvent) {
      yield* _mapUpdateNickname(event);
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
      var loginedUser = await this.userRepository.login(user.email, user.password).onError((error, stackTrace) => null);
      if (loginedUser != null) {
        var storeUser = await this.fireStoreRepository.loadUser(loginedUser["uid"]);
        if (storeUser != null) {
          yield Loaded(user: storeUser);
        } else {
          yield Error(message: "로그인에 실패하였습니다.");
        }
      } else {
        yield Error(message: "로그인에 실패하였습니다.");
      }
    } else {
      yield Loaded();
    }

  }

  Stream<UserState> _mapSignUpEvent(SignUpUserEvent event) async* {
    yield Loading();

    try {
      print("email: ${event.email}");
      print("pass: ${event.password}");
      var user = await this.userRepository.signUp(event.email, event.password);

      if (user != null) {
        await this.fireStoreRepository.signUpUser(
            ModakUser(uid: user.uid, email: user.email!, image: "", level: 1, nickname: ""));
        await this.apiRepository.postUser(user.uid);
      } else {
        yield Error(message: "회원가입에 실패하였습니다.");
      }
      yield SignUpSuccessed();
    } on FirebaseAuthException catch (e) {
      yield Error(message: "회원가입에 실패하였습니다. (${e.message??""})");
    }

  }

  Stream<UserState> _mapSelectUserEvent(SelectUserEvent event) async* {
  }

  Stream<UserState> _mapLoginUserEvent(LoginUserEvent event) async* {
    try {
      yield Loading();

      var user = await this.userRepository.login(event.user.email, event.user.password);

      if (user != null) {
        await this.dbRepository.saveUser(event.user);

        if (user["email"] != "" && user["level"] != "") {
          ModakUser? modakUser = await fireStoreRepository.loadUser(user["uid"]);
          if (modakUser != null) {
            yield Loaded(user: modakUser);
          } else {
            yield Error(message: "유저정보를 받아올 수 없습니다.");
          }
        } else {
          yield Error(message: '로그인에 실패하였습니다.');
        }
      } else {
        yield Error(message: '로그인에 실패하였습니다.');
      }

    } on FirebaseAuthException catch (e) {
      yield Error(message: "로그인에 실패했습니다. (${e.message!})");
    }
  }

  Stream<UserState> _mapUpdateNickname(UpdateNicknameEvent event) async* {
    yield NicknameUpdating();

    print('_mapUpdateNickname');

    String? token = userRepository.getUserToken();

    if (token != null) {
      bool nickname = await fireStoreRepository.checkNicknameDuplicate(event.nickname);
      print('nickname: ${nickname}');

      if (!nickname) {
        String? docKey = await fireStoreRepository.getUserDocKey(token);
        if (docKey != null) {
          bool? isUpdated = await fireStoreRepository.updateNickname(docKey, event.nickname);
          if (isUpdated != null && isUpdated) {
            yield NicknameUpdated();
          }
        } else {
          yield NicknameUpdateError(message: "유저정보를 받아올 수 없습니다.");
        }
      } else {
        yield NicknameUpdateError(message: "중복된 닉네임 입니다.");
      }
    } else {
      yield NicknameUpdateError(message: "로그인이 필요한 서비스입니다.");
    }
  }

}