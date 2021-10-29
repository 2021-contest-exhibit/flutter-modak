// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseGetCampingsFacilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetCampingsFacilities _$ResponseGetCampingsFacilitiesFromJson(
    Map<String, dynamic> json) {
  return ResponseGetCampingsFacilities(
    data: (json['data'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ResponseGetCampingsFacilitiesToJson(
        ResponseGetCampingsFacilities instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
