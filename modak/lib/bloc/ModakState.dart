
import 'package:equatable/equatable.dart';
import 'package:modak/dto/Matching.dart';

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
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => [];
}

class Loaded extends ModakState {

  @override
  List<Object?> get props => [];
}

class MatchingLoaded extends ModakState {
  final List<Matching>? matchings;
  final List<Matching>? myMatchings;

  MatchingLoaded({this.matchings, this.myMatchings});

  @override
  List<Object?> get props => [];

}