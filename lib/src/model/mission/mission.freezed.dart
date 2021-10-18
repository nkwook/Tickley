// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Mission _$MissionFromJson(Map<String, dynamic> json) {
  return _Mission.fromJson(json);
}

/// @nodoc
class _$MissionTearOff {
  const _$MissionTearOff();

  _Mission call(
      {required String label,
      required String description,
      required int point,
      required int id,
      required String emoji,
      required bool completed}) {
    return _Mission(
      label: label,
      description: description,
      point: point,
      id: id,
      emoji: emoji,
      completed: completed,
    );
  }

  Mission fromJson(Map<String, Object?> json) {
    return Mission.fromJson(json);
  }
}

/// @nodoc
const $Mission = _$MissionTearOff();

/// @nodoc
mixin _$Mission {
  String get label => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get emoji => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MissionCopyWith<Mission> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissionCopyWith<$Res> {
  factory $MissionCopyWith(Mission value, $Res Function(Mission) then) =
      _$MissionCopyWithImpl<$Res>;
  $Res call(
      {String label,
      String description,
      int point,
      int id,
      String emoji,
      bool completed});
}

/// @nodoc
class _$MissionCopyWithImpl<$Res> implements $MissionCopyWith<$Res> {
  _$MissionCopyWithImpl(this._value, this._then);

  final Mission _value;
  // ignore: unused_field
  final $Res Function(Mission) _then;

  @override
  $Res call({
    Object? label = freezed,
    Object? description = freezed,
    Object? point = freezed,
    Object? id = freezed,
    Object? emoji = freezed,
    Object? completed = freezed,
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
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$MissionCopyWith<$Res> implements $MissionCopyWith<$Res> {
  factory _$MissionCopyWith(_Mission value, $Res Function(_Mission) then) =
      __$MissionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String label,
      String description,
      int point,
      int id,
      String emoji,
      bool completed});
}

/// @nodoc
class __$MissionCopyWithImpl<$Res> extends _$MissionCopyWithImpl<$Res>
    implements _$MissionCopyWith<$Res> {
  __$MissionCopyWithImpl(_Mission _value, $Res Function(_Mission) _then)
      : super(_value, (v) => _then(v as _Mission));

  @override
  _Mission get _value => super._value as _Mission;

  @override
  $Res call({
    Object? label = freezed,
    Object? description = freezed,
    Object? point = freezed,
    Object? id = freezed,
    Object? emoji = freezed,
    Object? completed = freezed,
  }) {
    return _then(_Mission(
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
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Mission implements _Mission {
  _$_Mission(
      {required this.label,
      required this.description,
      required this.point,
      required this.id,
      required this.emoji,
      required this.completed});

  factory _$_Mission.fromJson(Map<String, dynamic> json) =>
      _$$_MissionFromJson(json);

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
  final bool completed;

  @override
  String toString() {
    return 'Mission(label: $label, description: $description, point: $point, id: $id, emoji: $emoji, completed: $completed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Mission &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, label, description, point, id, emoji, completed);

  @JsonKey(ignore: true)
  @override
  _$MissionCopyWith<_Mission> get copyWith =>
      __$MissionCopyWithImpl<_Mission>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MissionToJson(this);
  }
}

abstract class _Mission implements Mission {
  factory _Mission(
      {required String label,
      required String description,
      required int point,
      required int id,
      required String emoji,
      required bool completed}) = _$_Mission;

  factory _Mission.fromJson(Map<String, dynamic> json) = _$_Mission.fromJson;

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
  bool get completed;
  @override
  @JsonKey(ignore: true)
  _$MissionCopyWith<_Mission> get copyWith =>
      throw _privateConstructorUsedError;
}
