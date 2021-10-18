
import 'package:equatable/equatable.dart';
import 'package:modak/dto/Matching.dart';

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
  @override
  List<Object?> get props => [];

}