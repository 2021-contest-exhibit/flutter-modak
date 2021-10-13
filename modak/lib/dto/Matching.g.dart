// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Matching.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Matching _$_$_MatchingFromJson(Map<String, dynamic> json) {
  return _$_Matching(
    user: json['user'] as String?,
    email: json['email'] as String?,
    campingId: json['campingId'] as int,
    content: json['content'] == null
        ? null
        : Content.fromJson(json['content'] as Map<String, dynamic>),
    startDate: DateTime.parse(json['startDate'] as String),
    endDate: DateTime.parse(json['endDate'] as String),
    createDate: DateTime.parse(json['createDate'] as String),
  );
}

Map<String, dynamic> _$_$_MatchingToJson(_$_Matching instance) =>
    <String, dynamic>{
      'user': instance.user,
      'email': instance.email,
      'campingId': instance.campingId,
      'content': instance.content,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'createDate': instance.createDate.toIso8601String(),
    };
