// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MissionUser _$$_MissionUserFromJson(Map<String, dynamic> json) =>
    _$_MissionUser(
      accessToken: json['accessToken'] as String,
      nickname: json['nickname'] as String,
      id: json['id'] as int,
      point: json['point'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      completedAt: json['completedAt'] as String,
    );

Map<String, dynamic> _$$_MissionUserToJson(_$_MissionUser instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'nickname': instance.nickname,
      'id': instance.id,
      'point': instance.point,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'completedAt': instance.completedAt,
    };
