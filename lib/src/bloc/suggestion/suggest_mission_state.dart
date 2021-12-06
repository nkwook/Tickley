import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/model/mission/mission.dart';

@immutable
abstract class SuggestMissionState extends Equatable {}

class Empty extends SuggestMissionState {
  @override
  List<Object> get props => [];
}

class Loading extends SuggestMissionState {
  @override
  List<Object> get props => [];
}

class Error extends SuggestMissionState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class Loaded extends SuggestMissionState {
  final bool loaded;

  Loaded({
    required this.loaded,
  });

  @override
  List<Object> get props => [this.loaded];
}
