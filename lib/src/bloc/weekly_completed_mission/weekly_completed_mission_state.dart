import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/model/completed_mission/completed_mission.dart';

@immutable
abstract class WeeklyCompletedMissionState extends Equatable {}

class Empty extends WeeklyCompletedMissionState {
  @override
  List<Object> get props => [];
}

class Loading extends WeeklyCompletedMissionState {
  @override
  List<Object> get props => [];
}

class Error extends WeeklyCompletedMissionState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class Loaded extends WeeklyCompletedMissionState {
  final List<List<CompletedMission>> missions;

  Loaded({
    required this.missions,
  });

  @override
  List<Object> get props => [this.missions];
}
