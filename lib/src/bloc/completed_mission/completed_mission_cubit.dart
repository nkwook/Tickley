import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/completed_mission/completed_mission_state.dart';
import 'package:tickley/src/repository/completed_mission_repository.dart';

class CompletedMissionCubit extends Cubit<CompletedMissionState> {
  final CompletedMissionRepository repository;

  CompletedMissionCubit({required this.repository}) : super(Empty());

  fetchCompletedMissionsByUser(int id) async {
    try {
      emit(Loading());

      final resp = await this.repository.fetchCompletedMissionsByUser(id);

      final missions = resp;

      emit(Loaded(missions: missions));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
