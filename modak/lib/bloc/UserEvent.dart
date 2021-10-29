

import 'package:equatable/equatable.dart';
import 'package:modak/dto/SavedUser.dart';

abstract class UserEvent extends Equatable {}

class SelectUserEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

class LoginUserEvent extends UserEvent {
  SavedUser user;

  LoginUserEvent({required this.user});

  @override
  List<Object?> get props => [];
}

class LogoutUserEvent extends UserEvent {
  @override
  List<Object?> get props => [];

}

class SignUpUserEvent extends UserEvent {
  String email;
  String password;

  SignUpUserEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [];
}

class CheckUserEvent extends UserEvent {
  @override
  List<Object?> get props => [];

}

class UpdateNicknameEvent extends UserEvent {
  String nickname;

  UpdateNicknameEvent({required this.nickname});

  @override
  List<Object?> get props => [];
}