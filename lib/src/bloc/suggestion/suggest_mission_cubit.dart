import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/suggestion/suggest_mission_state.dart';

import 'package:tickley/src/repository/mission_repository.dart';

class SuggestMissionCubit extends Cubit<SuggestMissionState> {
  final MissionRepository repository;

  SuggestMissionCubit({required this.repository}) : super(Empty());

  postMissionSuggestion(String label, String description) async {
    try {
      emit(Loading());
      final resp =
          await this.repository.postMissionSuggestion(label, description);

      if (resp) {
        emit(Loaded(loaded: true));
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
