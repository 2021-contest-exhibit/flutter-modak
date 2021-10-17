
import 'package:equatable/equatable.dart';
import 'package:modak/rest/Content.dart';
import 'package:modak/rest/ResponseGetCampings.dart';
import 'package:modak/rest/ResponseGetUser.dart';

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


class CampingsLoaded extends CampingAPIState {
  final List<Content> content;

  CampingsLoaded({required this.content});

  @override
  List<Object?> get props => [];
}


class Error extends CampingAPIState {
  @override
  List<Object?> get props => [];
}

class TodayCampingsLoaded extends CampingAPIState {
  final List<Content> campings;

  TodayCampingsLoaded({required this.campings});

  @override
  List<Object?> get props => [];
}

class CampingFavoriteLoaded extends CampingAPIState {
  final int favorite;

  CampingFavoriteLoaded({required this.favorite});

  @override
  List<Object?> get props => [];


}

class UserGoodsLoaded extends CampingAPIState {
  final ResponseGetUser user;

  UserGoodsLoaded({required this.user});

  @override
  List<Object?> get props => [];

}