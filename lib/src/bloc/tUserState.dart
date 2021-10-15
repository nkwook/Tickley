import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/model/tUser/tUser.dart';

@immutable
abstract class TUserState extends Equatable {}

class Empty extends TUserState {
  @override
  List<Object> get props => [];
}

class Loading extends TUserState {
  @override
  List<Object> get props => [];
}

class Error extends TUserState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class Loaded extends TUserState {
  final TUser tUser;

  Loaded({
    required this.tUser,
  });

  @override
  List<Object> get props => [this.tUser];
}
