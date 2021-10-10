
import 'package:equatable/equatable.dart';

abstract class CampingAPIState extends Equatable {}

class Empty extends CampingAPIState {
  @override
  List<Object?> get props => [];
}

class Loading extends CampingAPIState {
  @override
  List<Object?> get props => [];
}

class Loaded extends CampingAPIState {
  final List<String>? dataEnvironments;
  final List<String>? dataOperationTypes;
  final List<String>? dataRegions;

  Loaded({this.dataEnvironments, this.dataOperationTypes, this.dataRegions});

  @override
  List<Object?> get props => [this.dataEnvironments, this.dataOperationTypes, this.dataRegions];
}

class Error extends CampingAPIState {
  @override
  List<Object?> get props => [];
}