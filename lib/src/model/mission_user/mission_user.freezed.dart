// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mission_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MissionUser _$MissionUserFromJson(Map<String, dynamic> json) {
  return _MissionUser.fromJson(json);
}

/// @nodoc
class _$MissionUserTearOff {
  const _$MissionUserTearOff();

  _MissionUser call(
      {required String accessToken,
      required String nickname,
      required int id,
      required int point,
      required String createdAt,
      required String updatedAt,
      required String completedAt}) {
    return _MissionUser(
      accessToken: accessToken,
      nickname: nickname,
      id: id,
      point: point,
      createdAt: createdAt,
      updatedAt: updatedAt,
      completedAt: completedAt,
    );
  }

  MissionUser fromJson(Map<String, Object?> json) {
    return MissionUser.fromJson(json);
  }
}

/// @nodoc
const $MissionUser = _$MissionUserTearOff();

/// @nodoc
mixin _$MissionUser {
  String get accessToken => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt =>
      throw _privateConstructorUsedError; // required String profileImage,
  String get completedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MissionUserCopyWith<MissionUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissionUserCopyWith<$Res> {
  factory $MissionUserCopyWith(
          MissionUser value, $Res Function(MissionUser) then) =
      _$MissionUserCopyWithImpl<$Res>;
  $Res call(
      {String accessToken,
      String nickname,
      int id,
      int point,
      String createdAt,
      String updatedAt,
      String completedAt});
}

/// @nodoc
class _$MissionUserCopyWithImpl<$Res> implements $MissionUserCopyWith<$Res> {
  _$MissionUserCopyWithImpl(this._value, this._then);

  final MissionUser _value;
  // ignore: unused_field
  final $Res Function(MissionUser) _then;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? nickname = freezed,
    Object? id = freezed,
    Object? point = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      completedAt: completedAt == freezed
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MissionUserCopyWith<$Res>
    implements $MissionUserCopyWith<$Res> {
  factory _$MissionUserCopyWith(
          _MissionUser value, $Res Function(_MissionUser) then) =
      __$MissionUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String accessToken,
      String nickname,
      int id,
      int point,
      String createdAt,
      String updatedAt,
      String completedAt});
}

/// @nodoc
class __$MissionUserCopyWithImpl<$Res> extends _$MissionUserCopyWithImpl<$Res>
    implements _$MissionUserCopyWith<$Res> {
  __$MissionUserCopyWithImpl(
      _MissionUser _value, $Res Function(_MissionUser) _then)
      : super(_value, (v) => _then(v as _MissionUser));

  @override
  _MissionUser get _value => super._value as _MissionUser;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? nickname = freezed,
    Object? id = freezed,
    Object? point = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_MissionUser(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
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
class _$_MissionUser implements _MissionUser {
  _$_MissionUser(
      {required this.accessToken,
      required this.nickname,
      required this.id,
      required this.point,
      required this.createdAt,
      required this.updatedAt,
      required this.completedAt});

  factory _$_MissionUser.fromJson(Map<String, dynamic> json) =>
      _$$_MissionUserFromJson(json);

  @override
  final String accessToken;
  @override
  final String nickname;
  @override
  final int id;
  @override
  final int point;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override // required String profileImage,
  final String completedAt;

  @override
  String toString() {
    return 'MissionUser(accessToken: $accessToken, nickname: $nickname, id: $id, point: $point, createdAt: $createdAt, updatedAt: $updatedAt, completedAt: $completedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MissionUser &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken, nickname, id, point,
      createdAt, updatedAt, completedAt);

  @JsonKey(ignore: true)
  @override
  _$MissionUserCopyWith<_MissionUser> get copyWith =>
      __$MissionUserCopyWithImpl<_MissionUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MissionUserToJson(this);
  }
}

abstract class _MissionUser implements MissionUser {
  factory _MissionUser(
      {required String accessToken,
      required String nickname,
      required int id,
      required int point,
      required String createdAt,
      required String updatedAt,
      required String completedAt}) = _$_MissionUser;

  factory _MissionUser.fromJson(Map<String, dynamic> json) =
      _$_MissionUser.fromJson;

  @override
  String get accessToken;
  @override
  String get nickname;
  @override
  int get id;
  @override
  int get point;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override // required String profileImage,
  String get completedAt;
  @override
  @JsonKey(ignore: true)
  _$MissionUserCopyWith<_MissionUser> get copyWith =>
      throw _privateConstructorUsedError;
}
