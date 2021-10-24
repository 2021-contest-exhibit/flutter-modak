// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'SavedUser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavedUser _$SavedUserFromJson(Map<String, dynamic> json) {
  return _SavedUser.fromJson(json);
}

/// @nodoc
class _$SavedUserTearOff {
  const _$SavedUserTearOff();

  _SavedUser call({required String email, required String password}) {
    return _SavedUser(
      email: email,
      password: password,
    );
  }

  SavedUser fromJson(Map<String, Object> json) {
    return SavedUser.fromJson(json);
  }
}

/// @nodoc
const $SavedUser = _$SavedUserTearOff();

/// @nodoc
mixin _$SavedUser {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedUserCopyWith<SavedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedUserCopyWith<$Res> {
  factory $SavedUserCopyWith(SavedUser value, $Res Function(SavedUser) then) =
      _$SavedUserCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$SavedUserCopyWithImpl<$Res> implements $SavedUserCopyWith<$Res> {
  _$SavedUserCopyWithImpl(this._value, this._then);

  final SavedUser _value;
  // ignore: unused_field
  final $Res Function(SavedUser) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SavedUserCopyWith<$Res> implements $SavedUserCopyWith<$Res> {
  factory _$SavedUserCopyWith(
          _SavedUser value, $Res Function(_SavedUser) then) =
      __$SavedUserCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class __$SavedUserCopyWithImpl<$Res> extends _$SavedUserCopyWithImpl<$Res>
    implements _$SavedUserCopyWith<$Res> {
  __$SavedUserCopyWithImpl(_SavedUser _value, $Res Function(_SavedUser) _then)
      : super(_value, (v) => _then(v as _SavedUser));

  @override
  _SavedUser get _value => super._value as _SavedUser;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_SavedUser(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SavedUser implements _SavedUser {
  _$_SavedUser({required this.email, required this.password});

  factory _$_SavedUser.fromJson(Map<String, dynamic> json) =>
      _$_$_SavedUserFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SavedUser(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SavedUser &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$SavedUserCopyWith<_SavedUser> get copyWith =>
      __$SavedUserCopyWithImpl<_SavedUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SavedUserToJson(this);
  }
}

abstract class _SavedUser implements SavedUser {
  factory _SavedUser({required String email, required String password}) =
      _$_SavedUser;

  factory _SavedUser.fromJson(Map<String, dynamic> json) =
      _$_SavedUser.fromJson;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SavedUserCopyWith<_SavedUser> get copyWith =>
      throw _privateConstructorUsedError;
}
