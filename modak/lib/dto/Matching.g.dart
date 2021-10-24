// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Matching.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Matching _$_$_MatchingFromJson(Map<String, dynamic> json) {
  return _$_Matching(
    user: json['user'] as String?,
    campingId: json['campingId'] as int,
    startDate: DateTime.parse(json['startDate'] as String),
    endDate: DateTime.parse(json['endDate'] as String),
    createDate: DateTime.parse(json['createDate'] as String),
    userList:
        (json['userList'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$_$_MatchingToJson(_$_Matching instance) =>
    <String, dynamic>{
      'user': instance.user,
      'campingId': instance.campingId,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'createDate': instance.createDate.toIso8601String(),
      'userList': instance.userList,
    };
