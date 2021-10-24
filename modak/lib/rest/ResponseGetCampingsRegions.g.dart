// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseGetCampingsRegions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetCampingsRegions _$ResponseGetCampingsRegionsFromJson(
    Map<String, dynamic> json) {
  return ResponseGetCampingsRegions(
    data: (json['data'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ResponseGetCampingsRegionsToJson(
        ResponseGetCampingsRegions instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
