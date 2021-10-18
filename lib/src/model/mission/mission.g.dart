// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Mission _$$_MissionFromJson(Map<String, dynamic> json) => _$_Mission(
    label: json['label'] as String,
    description: json['description'] as String,
    point: json['point'] as int,
    id: json['id'] as int,
    emoji: json['emoji'] as String,
    completed: json['completed'] == true ? true : false);

Map<String, dynamic> _$$_MissionToJson(_$_Mission instance) =>
    <String, dynamic>{
      'label': instance.label,
      'description': instance.description,
      'point': instance.point,
      'id': instance.id,
      'emoji': instance.emoji,
      'completed': instance.completed,
    };
