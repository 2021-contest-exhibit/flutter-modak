

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