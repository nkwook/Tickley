import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/model/tUser/tUser.dart';

@immutable
abstract class AuthState extends Equatable {
  late AuthState _tUserState;
  get tUserState => _tUserState;
}

class Empty extends AuthState {
  @override
  List<Object> get props => [];
}

class Loading extends AuthState {
  @override
  List<Object> get props => [];
}

class Register extends AuthState {
  @override
  List<Object> get props => [];
}

class Error extends AuthState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class Loaded extends AuthState {
  final TUser tUser;

  Loaded({
    required this.tUser,
  });

  @override
  List<Object> get props => [this.tUser];
}
