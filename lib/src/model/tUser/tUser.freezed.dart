// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tUser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TUser _$TUserFromJson(Map<String, dynamic> json) {
  return _TUser.fromJson(json);
}

/// @nodoc
class _$TUserTearOff {
  const _$TUserTearOff();

  _TUser call(
      {required String accessToken,
      required String nickname,
      required int id,
      required int point,
      required String createdAt,
      required String updatedAt,
      required String profileImage}) {
    return _TUser(
      accessToken: accessToken,
      nickname: nickname,
      id: id,
      point: point,
      createdAt: createdAt,
      updatedAt: updatedAt,
      profileImage: profileImage,
    );
  }

  TUser fromJson(Map<String, Object?> json) {
    return TUser.fromJson(json);
  }
}

/// @nodoc
const $TUser = _$TUserTearOff();

/// @nodoc
mixin _$TUser {
  String get accessToken => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  String get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TUserCopyWith<TUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TUserCopyWith<$Res> {
  factory $TUserCopyWith(TUser value, $Res Function(TUser) then) =
      _$TUserCopyWithImpl<$Res>;
  $Res call(
      {String accessToken,
      String nickname,
      int id,
      int point,
      String createdAt,
      String updatedAt,
      String profileImage});
}

/// @nodoc
class _$TUserCopyWithImpl<$Res> implements $TUserCopyWith<$Res> {
  _$TUserCopyWithImpl(this._value, this._then);

  final TUser _value;
  // ignore: unused_field
  final $Res Function(TUser) _then;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? nickname = freezed,
    Object? id = freezed,
    Object? point = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? profileImage = freezed,
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
      profileImage: profileImage == freezed
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TUserCopyWith<$Res> implements $TUserCopyWith<$Res> {
  factory _$TUserCopyWith(_TUser value, $Res Function(_TUser) then) =
      __$TUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String accessToken,
      String nickname,
      int id,
      int point,
      String createdAt,
      String updatedAt,
      String profileImage});
}

/// @nodoc
class __$TUserCopyWithImpl<$Res> extends _$TUserCopyWithImpl<$Res>
    implements _$TUserCopyWith<$Res> {
  __$TUserCopyWithImpl(_TUser _value, $Res Function(_TUser) _then)
      : super(_value, (v) => _then(v as _TUser));

  @override
  _TUser get _value => super._value as _TUser;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? nickname = freezed,
    Object? id = freezed,
    Object? point = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_TUser(
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
      profileImage: profileImage == freezed
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TUser implements _TUser {
  _$_TUser(
      {required this.accessToken,
      required this.nickname,
      required this.id,
      required this.point,
      required this.createdAt,
      required this.updatedAt,
      required this.profileImage});

  factory _$_TUser.fromJson(Map<String, dynamic> json) =>
      _$$_TUserFromJson(json);

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
  @override
  final String profileImage;

  @override
  String toString() {
    return 'TUser(accessToken: $accessToken, nickname: $nickname, id: $id, point: $point, createdAt: $createdAt, updatedAt: $updatedAt, profileImage: $profileImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TUser &&
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
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken, nickname, id, point,
      createdAt, updatedAt, profileImage);

  @JsonKey(ignore: true)
  @override
  _$TUserCopyWith<_TUser> get copyWith =>
      __$TUserCopyWithImpl<_TUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TUserToJson(this);
  }
}

abstract class _TUser implements TUser {
  factory _TUser(
      {required String accessToken,
      required String nickname,
      required int id,
      required int point,
      required String createdAt,
      required String updatedAt,
      required String profileImage}) = _$_TUser;

  factory _TUser.fromJson(Map<String, dynamic> json) = _$_TUser.fromJson;

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
  @override
  String get profileImage;
  @override
  @JsonKey(ignore: true)
  _$TUserCopyWith<_TUser> get copyWith => throw _privateConstructorUsedError;
}
