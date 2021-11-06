import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tickley/src/bloc/mission_user/mission_user_state.dart';

import 'package:tickley/src/repository/mission_user_repository.dart';

class MissionUserCubit extends Cubit<MissionUserState> {
  final MissionUserRepository repository;

  MissionUserCubit({required this.repository}) : super(Empty());

  fetchLastestUserbyMission(int id) async {
    try {
      emit(Loading());

      final resp = await this.repository.fetchLastestUserbyMission(id);

      final users = resp;

      emit(Loaded(users: users));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
