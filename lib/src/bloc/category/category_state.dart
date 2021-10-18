import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/model/category/category.dart';

@immutable
abstract class CategoryState extends Equatable {}

class Empty extends CategoryState {
  @override
  List<Object> get props => [];
}

class Loading extends CategoryState {
  @override
  List<Object> get props => [];
}

class Error extends CategoryState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class Loaded extends CategoryState {
  final List<Category> categories;

  Loaded({
    required this.categories,
  });

  @override
  List<Object> get props => [this.categories];
}
