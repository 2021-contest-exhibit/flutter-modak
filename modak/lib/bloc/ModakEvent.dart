
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:modak/dto/Chat.dart';
import 'package:modak/dto/Matching.dart';
import 'package:modak/rest/Content.dart';

abstract class ModakEvent extends Equatable{}

class CreateMatchingEvent extends ModakEvent {
  int campingId;
  DateTime startDate;
  DateTime endDate;
  DateTime createDate;

  CreateMatchingEvent({required this.campingId, required this.startDate, required this.endDate, required this.createDate});

  @override
  List<Object?> get props => [];

}

class LoadMatchingEvent extends ModakEvent {
  String? matchingId;
  String? lastDate;

  LoadMatchingEvent({this.matchingId, this.lastDate});

  @override
  List<Object?> get props => [];
}

class LoadMyMatchingEvent extends ModakEvent {
  @override
  List<Object?> get props => [];
}

class LoadJoinMatchingEvent extends ModakEvent {
  @override
  List<Object?> get props => [];
}

class LoadIsJoinMatchingEvent extends ModakEvent {
  String matchingId;

  LoadIsJoinMatchingEvent({required this.matchingId});
  @override
  List<Object?> get props => [matchingId];
}

class JoinMatchingEvent extends ModakEvent {
  String matchingId;

  JoinMatchingEvent({required this.matchingId});
  @override
  List<Object?> get props => [matchingId];
}

class LoadChattingEvent extends ModakEvent {
  String matchingId;
  List<Chat> values;

  LoadChattingEvent({required this.matchingId, required this.values});

  @override
  List<Object?> get props => [];

}

class PushMessageEvent extends ModakEvent {
  String matchingId;
  String message;

  PushMessageEvent({required this.matchingId, required this.message});

  @override
  List<Object?> get props => [];

}

class CampingSelectedEvent extends ModakEvent {
  final Content content;

  CampingSelectedEvent({required this.content});

  @override
  List<Object?> get props => [];
}