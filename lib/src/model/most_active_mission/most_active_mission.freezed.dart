// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'most_active_mission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MostActiveMission _$MostActiveMissionFromJson(Map<String, dynamic> json) {
  return _MostActiveMission.fromJson(json);
}

/// @nodoc
class _$MostActiveMissionTearOff {
  const _$MostActiveMissionTearOff();

  _MostActiveMission call(
      {required String label,
      required String description,
      required int point,
      required int id,
      required String emoji,
      required int completedCount}) {
    return _MostActiveMission(
      label: label,
      description: description,
      point: point,
      id: id,
      emoji: emoji,
      completedCount: completedCount,
    );
  }

  MostActiveMission fromJson(Map<String, Object?> json) {
    return MostActiveMission.fromJson(json);
  }
}

/// @nodoc
const $MostActiveMission = _$MostActiveMissionTearOff();

/// @nodoc
mixin _$MostActiveMission {
  String get label => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get emoji => throw _privateConstructorUsedError;
  int get completedCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MostActiveMissionCopyWith<MostActiveMission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MostActiveMissionCopyWith<$Res> {
  factory $MostActiveMissionCopyWith(
          MostActiveMission value, $Res Function(MostActiveMission) then) =
      _$MostActiveMissionCopyWithImpl<$Res>;
  $Res call(
      {String label,
      String description,
      int point,
      int id,
      String emoji,
      int completedCount});
}

/// @nodoc
class _$MostActiveMissionCopyWithImpl<$Res>
    implements $MostActiveMissionCopyWith<$Res> {
  _$MostActiveMissionCopyWithImpl(this._value, this._then);

  final MostActiveMission _value;
  // ignore: unused_field
  final $Res Function(MostActiveMission) _then;

  @override
  $Res call({
    Object? label = freezed,
    Object? description = freezed,
    Object? point = freezed,
    Object? id = freezed,
    Object? emoji = freezed,
    Object? completedCount = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      emoji: emoji == freezed
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      completedCount: completedCount == freezed
          ? _value.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$MostActiveMissionCopyWith<$Res>
    implements $MostActiveMissionCopyWith<$Res> {
  factory _$MostActiveMissionCopyWith(
          _MostActiveMission value, $Res Function(_MostActiveMission) then) =
      __$MostActiveMissionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String label,
      String description,
      int point,
      int id,
      String emoji,
      int completedCount});
}

/// @nodoc
class __$MostActiveMissionCopyWithImpl<$Res>
    extends _$MostActiveMissionCopyWithImpl<$Res>
    implements _$MostActiveMissionCopyWith<$Res> {
  __$MostActiveMissionCopyWithImpl(
      _MostActiveMission _value, $Res Function(_MostActiveMission) _then)
      : super(_value, (v) => _then(v as _MostActiveMission));

  @override
  _MostActiveMission get _value => super._value as _MostActiveMission;

  @override
  $Res call({
    Object? label = freezed,
    Object? description = freezed,
    Object? point = freezed,
    Object? id = freezed,
    Object? emoji = freezed,
    Object? completedCount = freezed,
  }) {
    return _then(_MostActiveMission(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      emoji: emoji == freezed
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      completedCount: completedCount == freezed
          ? _value.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MostActiveMission implements _MostActiveMission {
  _$_MostActiveMission(
      {required this.label,
      required this.description,
      required this.point,
      required this.id,
      required this.emoji,
      required this.completedCount});

  factory _$_MostActiveMission.fromJson(Map<String, dynamic> json) =>
      _$$_MostActiveMissionFromJson(json);

  @override
  final String label;
  @override
  final String description;
  @override
  final int point;
  @override
  final int id;
  @override
  final String emoji;
  @override
  final int completedCount;

  @override
  String toString() {
    return 'MostActiveMission(label: $label, description: $description, point: $point, id: $id, emoji: $emoji, completedCount: $completedCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MostActiveMission &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, label, description, point, id, emoji, completedCount);

  @JsonKey(ignore: true)
  @override
  _$MostActiveMissionCopyWith<_MostActiveMission> get copyWith =>
      __$MostActiveMissionCopyWithImpl<_MostActiveMission>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MostActiveMissionToJson(this);
  }
}

abstract class _MostActiveMission implements MostActiveMission {
  factory _MostActiveMission(
      {required String label,
      required String description,
      required int point,
      required int id,
      required String emoji,
      required int completedCount}) = _$_MostActiveMission;

  factory _MostActiveMission.fromJson(Map<String, dynamic> json) =
      _$_MostActiveMission.fromJson;

  @override
  String get label;
  @override
  String get description;
  @override
  int get point;
  @override
  int get id;
  @override
  String get emoji;
  @override
  int get completedCount;
  @override
  @JsonKey(ignore: true)
  _$MostActiveMissionCopyWith<_MostActiveMission> get copyWith =>
      throw _privateConstructorUsedError;
}
