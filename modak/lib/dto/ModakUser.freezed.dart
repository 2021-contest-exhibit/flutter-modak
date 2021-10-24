// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'ModakUser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ModakUser _$ModakUserFromJson(Map<String, dynamic> json) {
  return _ModakUser.fromJson(json);
}

/// @nodoc
class _$ModakUserTearOff {
  const _$ModakUserTearOff();

  _ModakUser call(
      {required String uid,
      required String email,
      required String image,
      required int level}) {
    return _ModakUser(
      uid: uid,
      email: email,
      image: image,
      level: level,
    );
  }

  ModakUser fromJson(Map<String, Object> json) {
    return ModakUser.fromJson(json);
  }
}

/// @nodoc
const $ModakUser = _$ModakUserTearOff();

/// @nodoc
mixin _$ModakUser {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModakUserCopyWith<ModakUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModakUserCopyWith<$Res> {
  factory $ModakUserCopyWith(ModakUser value, $Res Function(ModakUser) then) =
      _$ModakUserCopyWithImpl<$Res>;
  $Res call({String uid, String email, String image, int level});
}

/// @nodoc
class _$ModakUserCopyWithImpl<$Res> implements $ModakUserCopyWith<$Res> {
  _$ModakUserCopyWithImpl(this._value, this._then);

  final ModakUser _value;
  // ignore: unused_field
  final $Res Function(ModakUser) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? image = freezed,
    Object? level = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ModakUserCopyWith<$Res> implements $ModakUserCopyWith<$Res> {
  factory _$ModakUserCopyWith(
          _ModakUser value, $Res Function(_ModakUser) then) =
      __$ModakUserCopyWithImpl<$Res>;
  @override
  $Res call({String uid, String email, String image, int level});
}

/// @nodoc
class __$ModakUserCopyWithImpl<$Res> extends _$ModakUserCopyWithImpl<$Res>
    implements _$ModakUserCopyWith<$Res> {
  __$ModakUserCopyWithImpl(_ModakUser _value, $Res Function(_ModakUser) _then)
      : super(_value, (v) => _then(v as _ModakUser));

  @override
  _ModakUser get _value => super._value as _ModakUser;

  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? image = freezed,
    Object? level = freezed,
  }) {
    return _then(_ModakUser(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModakUser implements _ModakUser {
  _$_ModakUser(
      {required this.uid,
      required this.email,
      required this.image,
      required this.level});

  factory _$_ModakUser.fromJson(Map<String, dynamic> json) =>
      _$_$_ModakUserFromJson(json);

  @override
  final String uid;
  @override
  final String email;
  @override
  final String image;
  @override
  final int level;

  @override
  String toString() {
    return 'ModakUser(uid: $uid, email: $email, image: $image, level: $level)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ModakUser &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(level);

  @JsonKey(ignore: true)
  @override
  _$ModakUserCopyWith<_ModakUser> get copyWith =>
      __$ModakUserCopyWithImpl<_ModakUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ModakUserToJson(this);
  }
}

abstract class _ModakUser implements ModakUser {
  factory _ModakUser(
      {required String uid,
      required String email,
      required String image,
      required int level}) = _$_ModakUser;

  factory _ModakUser.fromJson(Map<String, dynamic> json) =
      _$_ModakUser.fromJson;

  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get image => throw _privateConstructorUsedError;
  @override
  int get level => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ModakUserCopyWith<_ModakUser> get copyWith =>
      throw _privateConstructorUsedError;
}
