import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/most_active_mission/most_active_mission_state.dart';
import 'package:tickley/src/repository/most_active_mission_repostitory.dart';

class MostActiveMissionCubit extends Cubit<MostActiveMissionState> {
  final MostActiveMissionRepository repository;

  MostActiveMissionCubit({required this.repository}) : super(Empty());

  fetchMostActiveMissions() async {
    try {
      emit(Loading());

      final resp = await this.repository.fetchMostActiveMissions();
      print(resp);
      final missions = resp;

      emit(Loaded(missions: missions));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
