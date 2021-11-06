import 'package:freezed_annotation/freezed_annotation.dart';

part 'most_active_mission.freezed.dart';
part 'most_active_mission.g.dart';

@freezed
class MostActiveMission with _$MostActiveMission {
  factory MostActiveMission(
      {required String label,
      required String description,
      required int point,
      required int id,
      required String emoji,
      required int completedCount}) = _MostActiveMission;

  factory MostActiveMission.fromJson(Map<String, dynamic> json) =>
      _$MostActiveMissionFromJson(json);
}
