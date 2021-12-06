import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:tickley/src/model/mission_user/mission_user.dart';

@immutable
abstract class MissionUserState extends Equatable {}

class Empty extends MissionUserState {
  @override
  List<Object> get props => [];
}

class Loading extends MissionUserState {
  @override
  List<Object> get props => [];
}

class Error extends MissionUserState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class Loaded extends MissionUserState {
  final List<MissionUser> users;

  Loaded({
    required this.users,
  });

  @override
  List<Object> get props => [this.users];
}
