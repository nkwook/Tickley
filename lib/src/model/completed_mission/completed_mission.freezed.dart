// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'completed_mission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompletedMission _$CompletedMissionFromJson(Map<String, dynamic> json) {
  return _CompletedMission.fromJson(json);
}

/// @nodoc
class _$CompletedMissionTearOff {
  const _$CompletedMissionTearOff();

  _CompletedMission call(
      {required String label,
      required String description,
      required int point,
      required int id,
      required String emoji,
      required String completedAt}) {
    return _CompletedMission(
      label: label,
      description: description,
      point: point,
      id: id,
      emoji: emoji,
      completedAt: completedAt,
    );
  }

  CompletedMission fromJson(Map<String, Object?> json) {
    return CompletedMission.fromJson(json);
  }
}

/// @nodoc
const $CompletedMission = _$CompletedMissionTearOff();

/// @nodoc
mixin _$CompletedMission {
  String get label => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get emoji => throw _privateConstructorUsedError;
  String get completedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompletedMissionCopyWith<CompletedMission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompletedMissionCopyWith<$Res> {
  factory $CompletedMissionCopyWith(
          CompletedMission value, $Res Function(CompletedMission) then) =
      _$CompletedMissionCopyWithImpl<$Res>;
  $Res call(
      {String label,
      String description,
      int point,
      int id,
      String emoji,
      String completedAt});
}

/// @nodoc
class _$CompletedMissionCopyWithImpl<$Res>
    implements $CompletedMissionCopyWith<$Res> {
  _$CompletedMissionCopyWithImpl(this._value, this._then);

  final CompletedMission _value;
  // ignore: unused_field
  final $Res Function(CompletedMission) _then;

  @override
  $Res call({
    Object? label = freezed,
    Object? description = freezed,
    Object? point = freezed,
    Object? id = freezed,
    Object? emoji = freezed,
    Object? completedAt = freezed,
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
      completedAt: completedAt == freezed
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CompletedMissionCopyWith<$Res>
    implements $CompletedMissionCopyWith<$Res> {
  factory _$CompletedMissionCopyWith(
          _CompletedMission value, $Res Function(_CompletedMission) then) =
      __$CompletedMissionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String label,
      String description,
      int point,
      int id,
      String emoji,
      String completedAt});
}

/// @nodoc
class __$CompletedMissionCopyWithImpl<$Res>
    extends _$CompletedMissionCopyWithImpl<$Res>
    implements _$CompletedMissionCopyWith<$Res> {
  __$CompletedMissionCopyWithImpl(
      _CompletedMission _value, $Res Function(_CompletedMission) _then)
      : super(_value, (v) => _then(v as _CompletedMission));

  @override
  _CompletedMission get _value => super._value as _CompletedMission;

  @override
  $Res call({
    Object? label = freezed,
    Object? description = freezed,
    Object? point = freezed,
    Object? id = freezed,
    Object? emoji = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_CompletedMission(
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
      completedAt: completedAt == freezed
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompletedMission implements _CompletedMission {
  _$_CompletedMission(
      {required this.label,
      required this.description,
      required this.point,
      required this.id,
      required this.emoji,
      required this.completedAt});

  factory _$_CompletedMission.fromJson(Map<String, dynamic> json) =>
      _$$_CompletedMissionFromJson(json);

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
  final String completedAt;

  @override
  String toString() {
    return 'CompletedMission(label: $label, description: $description, point: $point, id: $id, emoji: $emoji, completedAt: $completedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompletedMission &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, label, description, point, id, emoji, completedAt);

  @JsonKey(ignore: true)
  @override
  _$CompletedMissionCopyWith<_CompletedMission> get copyWith =>
      __$CompletedMissionCopyWithImpl<_CompletedMission>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompletedMissionToJson(this);
  }
}

abstract class _CompletedMission implements CompletedMission {
  factory _CompletedMission(
      {required String label,
      required String description,
      required int point,
      required int id,
      required String emoji,
      required String completedAt}) = _$_CompletedMission;

  factory _CompletedMission.fromJson(Map<String, dynamic> json) =
      _$_CompletedMission.fromJson;

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
  String get completedAt;
  @override
  @JsonKey(ignore: true)
  _$CompletedMissionCopyWith<_CompletedMission> get copyWith =>
      throw _privateConstructorUsedError;
}
