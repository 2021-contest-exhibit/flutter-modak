
import 'package:equatable/equatable.dart';

abstract class ModakState extends Equatable {}

class Empty extends ModakState {
  @override
  List<Object?> get props => [];
}

class Loading extends ModakState {
  @override
  List<Object?> get props => [];
}

class Error extends ModakState {

  @override
  List<Object?> get props => [];
}

class Loaded extends ModakState {

  @override
  List<Object?> get props => [];
}
