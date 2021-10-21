
import 'package:equatable/equatable.dart';
import 'package:modak/dto/Chat.dart';
import 'package:modak/dto/Matching.dart';
import 'package:modak/dto/ModakChat.dart';
import 'package:modak/dto/ModakMatching.dart';

abstract class ModakState extends Equatable {}

class Empty extends ModakState {
  @override
  List<Object?> get props => [];
}

class Loading extends ModakState {
  @override
  List<Object?> get props => [];
}

class MyMatchingLoading extends ModakState {
  @override
  List<Object?> get props => [];
}

class MatchingLoading extends ModakState {
  @override
  List<Object?> get props => [];
}

class ChattingLoading extends ModakState {
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
  final List<ModakMatching>? matchings;

  MatchingLoaded({this.matchings});

  @override
  List<Object?> get props => [];

}

class MyMatchingLoaded extends ModakState {
  final List<ModakMatching>? matchings;

  MyMatchingLoaded({this.matchings});

  @override
  List<Object?> get props => [];
}

class ChattingLoaded extends ModakState {
  final List<ModakChat>? chatList;

  ChattingLoaded({required this.chatList});

  @override
  List<Object?> get props => [];


}