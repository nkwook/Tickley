import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tickley/src/bloc/popular_mission/popular_mission_state.dart';
import 'package:tickley/src/repository/mission_repository.dart';

class PopularMissionCubit extends Cubit<PopularMissionState> {
  final MissionRepository repository;

  PopularMissionCubit({required this.repository}) : super(Empty());

  fetchPopularMissions() async {
    try {
      emit(Loading());

      final resp = await this.repository.fetchMissions(true, 1, 5);

      final missions = resp;

      emit(Loaded(missions: missions));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
