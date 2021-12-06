import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/model/completed_mission/completed_mission.dart';

@immutable
abstract class CompletedMissionState extends Equatable {}

class Empty extends CompletedMissionState {
  @override
  List<Object> get props => [];
}

class Loading extends CompletedMissionState {
  @override
  List<Object> get props => [];
}

class Error extends CompletedMissionState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class Loaded extends CompletedMissionState {
  final List<CompletedMission> missions;

  Loaded({
    required this.missions,
  });

  @override
  List<Object> get props => [this.missions];
}
