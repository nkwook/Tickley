import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/model/mission/mission.dart';
import 'package:tickley/src/model/most_active_mission/most_active_mission.dart';

@immutable
abstract class MostActiveMissionState extends Equatable {}

class Empty extends MostActiveMissionState {
  @override
  List<Object> get props => [];
}

class Loading extends MostActiveMissionState {
  @override
  List<Object> get props => [];
}

class Error extends MostActiveMissionState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class Loaded extends MostActiveMissionState {
  final List<MostActiveMission> missions;

  Loaded({
    required this.missions,
  });

  @override
  List<Object> get props => [this.missions];
}
