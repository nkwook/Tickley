import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/favorite_mission/favorite_mission_state.dart';
import 'package:tickley/src/model/mission/mission.dart';

import 'package:tickley/src/repository/favorite_mission_repository.dart';

class FavoriteMissionCubit extends Cubit<FavoriteMissionState> {
  final FavoriteMissionRepository repository;

  FavoriteMissionCubit({required this.repository}) : super(Empty());

  fetchFavoriteMissionsByUser(int id) async {
    try {
      emit(Loading());

      final resp = await this.repository.fetchFavoriteMissionsByUser(id);

      final missions = resp;

      emit(Loaded(missions: missions));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  addFavoriteMission(int userId, int missionId) async {
    try {
      final resp = await this.repository.addFavoriteMission(userId, missionId);
      print(resp);

      emit(Loaded(missions: resp));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  deleteFavoriteMission(int userId, int missionId) async {
    try {
      final resp =
          await this.repository.deleteFavoriteMission(userId, missionId);

      emit(Loaded(missions: resp));
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
            print(m.completed);
          }
        }
        emit(Loaded(missions: mList));
        final resp =
            await this.repository.postMissionCompleted(userId, missionId);
        final missions = resp;
        emit(Loaded(missions: missions));
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
