import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/missions/mission_state.dart';
import 'package:tickley/src/model/mission/mission.dart';
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

  postMissionCompleted(int userId, int missionId) async {
    try {
      if (state is Loaded) {
        var parsedState = (state as Loaded);
        List<Mission> mList = parsedState.missions;

        for (Mission m in mList) {
          if (m.id == missionId) {
            Mission mm = m.copyWith(completed: true);
            m = mm;
          }
        }

        // emit(Loaded(missions: mList));
        final resp =
            await this.repository.postMissionCompleted(userId, missionId);
        print(resp);
        print(mList.toString());
        emit(Loaded(missions: []));
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
