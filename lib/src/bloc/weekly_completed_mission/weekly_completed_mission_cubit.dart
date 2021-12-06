import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tickley/src/bloc/weekly_completed_mission/weekly_completed_mission_state.dart';
import 'package:tickley/src/repository/completed_mission_repository.dart';

class WeeklyCompletedMissionCubit extends Cubit<WeeklyCompletedMissionState> {
  final CompletedMissionRepository repository;

  WeeklyCompletedMissionCubit({required this.repository}) : super(Empty());

  fetchWeeklyCompletedMissionsByUser(int id) async {
    try {
      emit(Loading());

      final resp = await this.repository.fetchWeeklyCompletedMissionsByUser(id);
      final missions = resp;

      emit(Loaded(missions: missions));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
