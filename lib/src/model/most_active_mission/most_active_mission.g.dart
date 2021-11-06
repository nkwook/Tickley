// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'most_active_mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MostActiveMission _$$_MostActiveMissionFromJson(Map<String, dynamic> json) =>
    _$_MostActiveMission(
      label: json['label'] as String,
      description: json['description'] as String,
      point: json['point'] as int,
      id: json['id'] as int,
      emoji: json['emoji'] as String,
      completedCount: json['completedCount'] as int,
    );

Map<String, dynamic> _$$_MostActiveMissionToJson(
        _$_MostActiveMission instance) =>
    <String, dynamic>{
      'label': instance.label,
      'description': instance.description,
      'point': instance.point,
      'id': instance.id,
      'emoji': instance.emoji,
      'completedCount': instance.completedCount,
    };
