// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseGetCampingsEnvironments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetCampingsEnvironments _$ResponseGetCampingsEnvironmentsFromJson(
    Map<String, dynamic> json) {
  return ResponseGetCampingsEnvironments(
    data: (json['data'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ResponseGetCampingsEnvironmentsToJson(
        ResponseGetCampingsEnvironments instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
