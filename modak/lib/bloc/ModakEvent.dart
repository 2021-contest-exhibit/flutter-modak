
import 'package:equatable/equatable.dart';
import 'package:modak/dto/Matching.dart';

abstract class ModakEvent extends Equatable{}

class CreateMatchingEvent extends ModakEvent {
  Matching matching;

  CreateMatchingEvent({required this.matching});



  @override
  List<Object?> get props => [];

}