// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompletedMission _$$_CompletedMissionFromJson(Map<String, dynamic> json) =>
    _$_CompletedMission(
      label: json['label'] as String,
      description: json['description'] as String,
      point: json['point'] as int,
      id: json['id'] as int,
      emoji: json['emoji'] as String,
      completedAt: json['completedAt'] as String,
    );

Map<String, dynamic> _$$_CompletedMissionToJson(_$_CompletedMission instance) =>
    <String, dynamic>{
      'label': instance.label,
      'description': instance.description,
      'point': instance.point,
      'id': instance.id,
      'emoji': instance.emoji,
      'completedAt': instance.completedAt,
    };
