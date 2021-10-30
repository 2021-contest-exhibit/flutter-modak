import 'package:equatable/equatable.dart';
import 'package:modak/dto/ModakUser.dart';

abstract class UserState extends Equatable {}

class Empty extends UserState {
  @override
  List<Object?> get props => [];
}

class Loading extends UserState {
  @override
  List<Object?> get props => [];
}

class Error extends UserState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => [this.message];
}

class Loaded extends UserState {
  final ModakUser? user;

  Loaded({this.user});

  @override
  List<Object?> get props => [this.user];
}

class SignUpSuccessed extends UserState {
  @override
  List<Object?> get props => [];
}

class NicknameUpdated extends UserState {
  @override
  List<Object?> get props => [];
}

class NicknameUpdating extends UserState {
  @override
  List<Object?> get props => [];
}

class NicknameUpdateError extends UserState {
  String message;

  NicknameUpdateError({required this.message});

  @override
  List<Object?> get props => [];
}