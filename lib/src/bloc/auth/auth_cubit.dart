import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/repository/tUser_repository.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final TUserRepository repository;

  AuthCubit({required this.repository}) : super(Empty());

  userLogin() async {
    try {
      emit(Loading());

      final resp = await this.repository.userLogin();

      final tUser = resp;

      emit(Loaded(tUser: tUser));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  createUser(String nickname, String accessToken, String profileImage) async {
    try {
      emit(Loading());
      final status =
          await this.repository.createUser(nickname, accessToken, profileImage);
      print(status);
      final resp = await this.repository.userLogin();
      final tUser = resp;

      emit(Loaded(tUser: tUser));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
