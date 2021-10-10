// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'Matching.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Matching _$MatchingFromJson(Map<String, dynamic> json) {
  return _Matching.fromJson(json);
}

/// @nodoc
class _$MatchingTearOff {
  const _$MatchingTearOff();

  _Matching call(
      {required String user,
      required int campingId,
      required DateTime startDate,
      required DateTime endDate,
      required DateTime createDate}) {
    return _Matching(
      user: user,
      campingId: campingId,
      startDate: startDate,
      endDate: endDate,
      createDate: createDate,
    );
  }

  Matching fromJson(Map<String, Object> json) {
    return Matching.fromJson(json);
  }
}

/// @nodoc
const $Matching = _$MatchingTearOff();

/// @nodoc
mixin _$Matching {
  String get user => throw _privateConstructorUsedError;
  int get campingId => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  DateTime get createDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchingCopyWith<Matching> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchingCopyWith<$Res> {
  factory $MatchingCopyWith(Matching value, $Res Function(Matching) then) =
      _$MatchingCopyWithImpl<$Res>;
  $Res call(
      {String user,
      int campingId,
      DateTime startDate,
      DateTime endDate,
      DateTime createDate});
}

/// @nodoc
class _$MatchingCopyWithImpl<$Res> implements $MatchingCopyWith<$Res> {
  _$MatchingCopyWithImpl(this._value, this._then);

  final Matching _value;
  // ignore: unused_field
  final $Res Function(Matching) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? campingId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? createDate = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      campingId: campingId == freezed
          ? _value.campingId
          : campingId // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createDate: createDate == freezed
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$MatchingCopyWith<$Res> implements $MatchingCopyWith<$Res> {
  factory _$MatchingCopyWith(_Matching value, $Res Function(_Matching) then) =
      __$MatchingCopyWithImpl<$Res>;
  @override
  $Res call(
      {String user,
      int campingId,
      DateTime startDate,
      DateTime endDate,
      DateTime createDate});
}

/// @nodoc
class __$MatchingCopyWithImpl<$Res> extends _$MatchingCopyWithImpl<$Res>
    implements _$MatchingCopyWith<$Res> {
  __$MatchingCopyWithImpl(_Matching _value, $Res Function(_Matching) _then)
      : super(_value, (v) => _then(v as _Matching));

  @override
  _Matching get _value => super._value as _Matching;

  @override
  $Res call({
    Object? user = freezed,
    Object? campingId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? createDate = freezed,
  }) {
    return _then(_Matching(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      campingId: campingId == freezed
          ? _value.campingId
          : campingId // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createDate: createDate == freezed
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Matching implements _Matching {
  _$_Matching(
      {required this.user,
      required this.campingId,
      required this.startDate,
      required this.endDate,
      required this.createDate});

  factory _$_Matching.fromJson(Map<String, dynamic> json) =>
      _$_$_MatchingFromJson(json);

  @override
  final String user;
  @override
  final int campingId;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final DateTime createDate;

  @override
  String toString() {
    return 'Matching(user: $user, campingId: $campingId, startDate: $startDate, endDate: $endDate, createDate: $createDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Matching &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.campingId, campingId) ||
                const DeepCollectionEquality()
                    .equals(other.campingId, campingId)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.createDate, createDate) ||
                const DeepCollectionEquality()
                    .equals(other.createDate, createDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(campingId) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(createDate);

  @JsonKey(ignore: true)
  @override
  _$MatchingCopyWith<_Matching> get copyWith =>
      __$MatchingCopyWithImpl<_Matching>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MatchingToJson(this);
  }
}

abstract class _Matching implements Matching {
  factory _Matching(
      {required String user,
      required int campingId,
      required DateTime startDate,
      required DateTime endDate,
      required DateTime createDate}) = _$_Matching;

  factory _Matching.fromJson(Map<String, dynamic> json) = _$_Matching.fromJson;

  @override
  String get user => throw _privateConstructorUsedError;
  @override
  int get campingId => throw _privateConstructorUsedError;
  @override
  DateTime get startDate => throw _privateConstructorUsedError;
  @override
  DateTime get endDate => throw _privateConstructorUsedError;
  @override
  DateTime get createDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MatchingCopyWith<_Matching> get copyWith =>
      throw _privateConstructorUsedError;
}
