import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/model/mission/mission.dart';

@immutable
abstract class FavoriteMissionState extends Equatable {}

class Empty extends FavoriteMissionState {
  @override
  List<Object> get props => [];
}

class Loading extends FavoriteMissionState {
  @override
  List<Object> get props => [];
}

class Error extends FavoriteMissionState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class Loaded extends FavoriteMissionState {
  final List<Mission> missions;

  Loaded({
    required this.missions,
  });

  @override
  List<Object> get props => [this.missions];
}
