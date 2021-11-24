// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TUser _$$_TUserFromJson(Map<String, dynamic> json) => _$_TUser(
      accessToken: json['accessToken'] as String,
      nickname: json['nickname'] as String,
      id: json['id'] as int,
      point: json['point'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      profileImage: json['profileImage'] as String,
      rank: json['rank'] != null ? json['rank'] : -1 as int,
      pointPercentage: json['pointPercentage'] != null
          ? (json['pointPercentage'] as num).toDouble()
          : -1.0 as double,
    );

Map<String, dynamic> _$$_TUserToJson(_$_TUser instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'nickname': instance.nickname,
      'id': instance.id,
      'point': instance.point,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'profileImage': instance.profileImage,
      'rank': instance.rank,
      'pointPercentage': instance.pointPercentage,
    };
