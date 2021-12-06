import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/model/tUser/tUser.dart';

@immutable
abstract class PointState extends Equatable {}

class Empty extends PointState {
  @override
  List<Object> get props => [];
}

class Loading extends PointState {
  @override
  List<Object> get props => [];
}

class Error extends PointState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class Loaded extends PointState {
  final int point;
  final int userLength;

  Loaded({required this.point, required this.userLength});

  @override
  List<Object> get props => [this.point, this.userLength];
}
