import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/mission/mission_state.dart';
import 'package:tickley/src/repository/mission_repository.dart';

class MissionCubit extends Cubit<MissionState> {
  final MissionRepository repository;

  MissionCubit({required this.repository}) : super(Empty());

  fetchMissionsByCategory(int id) async {
    try {
      emit(Loading());

      final resp = await this.repository.fetchMissionsByCategory(id);

      final missions = resp;

      emit(Loaded(missions: missions));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
