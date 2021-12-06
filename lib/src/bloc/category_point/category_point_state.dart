import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CategoryPointState extends Equatable {}

class Empty extends CategoryPointState {
  @override
  List<Object> get props => [];
}

class Loading extends CategoryPointState {
  @override
  List<Object> get props => [];
}

class Error extends CategoryPointState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class Loaded extends CategoryPointState {
  final List<double> points;

  Loaded({required this.points});

  @override
  List<Object> get props => [this.points];
}
