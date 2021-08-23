import 'package:equatable/equatable.dart';
import 'package:modak/dto/User.dart';

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
  final User user;

  Loaded({required this.user});

  @override
  List<Object?> get props => [this.user];
}
