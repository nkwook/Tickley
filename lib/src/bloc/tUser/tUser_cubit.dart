import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/repository/tUser_repository.dart';

import 'tUser_state.dart';

class TUserCubit extends Cubit<TUserState> {
  final TUserRepository repository;

  TUserCubit({required this.repository}) : super(Empty());

  fetchUserData() async {
    try {
      emit(Loading());

      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) throw Exception('Failed to login');

      final resp = await this.repository.userLogin(user.uid);

      final tUser = resp;

      emit(Loaded(tUser: tUser));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
