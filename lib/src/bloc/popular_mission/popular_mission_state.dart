import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/model/mission/mission.dart';

@immutable
abstract class PopularMissionState extends Equatable {
  late PopularMissionState _popularMissionState;
  get missons => _popularMissionState.missons;
}

class Empty extends PopularMissionState {
  @override
  List<Object> get props => [];
}

class Loading extends PopularMissionState {
  @override
  List<Object> get props => [];
}

class Error extends PopularMissionState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class Loaded extends PopularMissionState {
  final List<Mission> missions;
  Loaded({required this.missions});

  @override
  List<Object> get props => [this.missions];
}
