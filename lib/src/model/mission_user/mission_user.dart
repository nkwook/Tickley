import 'package:freezed_annotation/freezed_annotation.dart';

part 'mission_user.freezed.dart';
part 'mission_user.g.dart';

@freezed
class MissionUser with _$MissionUser {
  factory MissionUser({
    required String accessToken,
    required String nickname,
    required int id,
    required int point,
    required String createdAt,
    required String updatedAt,
    // required String profileImage,
    required String completedAt,
  }) = _MissionUser;

  factory MissionUser.fromJson(Map<String, dynamic> json) =>
      _$MissionUserFromJson(json);
}
