import 'package:freezed_annotation/freezed_annotation.dart';

part 'tUser.freezed.dart';
part 'tUser.g.dart';

@freezed
class TUser with _$TUser {
  factory TUser(
      {required String accessToken,
      required String nickname,
      required int id,
      required int point,
      required String createdAt,
      required String updatedAt,
      required String profileImage,
      required int rank,
      required double pointPercentage}) = _TUser;

  factory TUser.fromJson(Map<String, dynamic> json) => _$TUserFromJson(json);
}
