import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/model/mission/mission.dart';

@immutable
abstract class MissionState extends Equatable {}

class Empty extends MissionState {
  @override
  List<Object> get props => [];
}

class Loading extends MissionState {
  @override
  List<Object> get props => [];
}

class Error extends MissionState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class Loaded extends MissionState {
  final List<Mission> missions;

  Loaded({
    required this.missions,
  });

  @override
  List<Object> get props => [this.missions];
}
