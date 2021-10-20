import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/repository/tUser_repository.dart';

import 'tUser_state.dart';

class TUserCubit extends Cubit<TUserState> {
  final TUserRepository repository;

  TUserCubit({required this.repository}) : super(Empty());

  fetchUserData() async {
    try {
      emit(Loading());

      final resp = await this.repository.userLogin();

      final tUser = resp;

      emit(Loaded(tUser: tUser));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
