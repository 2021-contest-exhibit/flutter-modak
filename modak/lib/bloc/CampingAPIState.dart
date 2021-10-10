
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
  @override
  List<Object?> get props => [];
}

class Error extends CampingAPIState {
  @override
  List<Object?> get props => [];
}