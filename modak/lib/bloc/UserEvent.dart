

import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {}

class SelectUserEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}