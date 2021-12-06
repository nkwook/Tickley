// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompletedMission _$$_CompletedMissionFromJson(Map<String, dynamic> json) =>
    _$_CompletedMission(
      date: json['date'] != null ? json['date'] as String : '',
      week: json['week'] != null ? json['week'] as int : -1,
      label: json['label'] as String,
      description: json['description'] as String,
      point: json['point'] as int,
      id: json['id'] as int,
      emoji: json['emoji'] as String,
      completed: json['completed'] != null ? json['completed'] as int : 0,
      completedAt:
          json['completedAt'] != null ? json['completedAt'] as String : 'ㅇㅇ',
    );

Map<String, dynamic> _$$_CompletedMissionToJson(_$_CompletedMission instance) =>
    <String, dynamic>{
      'date': instance.date,
      'week': instance.week,
      'label': instance.label,
      'description': instance.description,
      'point': instance.point,
      'id': instance.id,
      'emoji': instance.emoji,
      'completed': instance.completed,
      'completedAt': instance.completedAt,
    };
