import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/repository/tUser_repository.dart';
import 'package:tickley/src/utils/authentication.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final TUserRepository repository;

  AuthCubit({required this.repository}) : super(Empty());

  userLogin() async {
    try {
      emit(Loading());
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) throw Exception('Failed to login');
      // String accessToken = user.uid;

      final resp = await this.repository.userLogin(user.uid);

      final tUser = resp;
      if (tUser.id == null) {
        emit(Register());
      } else {
        emit(Loaded(tUser: tUser));
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  createUser(String nickname, String accessToken, String profileImage) async {
    try {
      emit(Loading());
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) throw Exception('Failed to login');

      final status =
          await this.repository.createUser(nickname, accessToken, profileImage);
      print(status);
      final resp = await this.repository.userLogin(user.uid);
      final tUser = resp;

      emit(Loaded(tUser: tUser));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
