import 'package:freezed_annotation/freezed_annotation.dart';

part 'completed_mission.freezed.dart';
part 'completed_mission.g.dart';

@freezed
class CompletedMission with _$CompletedMission {
  factory CompletedMission(
      {required String date,
      required int week,
      required String label,
      required String description,
      required int point,
      required int id,
      required String emoji,
      required int completed,
      required String completedAt}) = _CompletedMission;

  factory CompletedMission.fromJson(Map<String, dynamic> json) =>
      _$CompletedMissionFromJson(json);
}
