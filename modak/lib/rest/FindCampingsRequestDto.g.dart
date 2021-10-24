// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FindCampingsRequestDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindCampingsRequestDto _$FindCampingsRequestDtoFromJson(
    Map<String, dynamic> json) {
  return FindCampingsRequestDto(
    operationTypeEqual: (json['operationTypeEqual'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    regionContains: (json['regionContains'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    environmentEqual: (json['environmentEqual'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    nameContains: json['nameContains'] as String,
  );
}

Map<String, dynamic> _$FindCampingsRequestDtoToJson(
        FindCampingsRequestDto instance) =>
    <String, dynamic>{
      'operationTypeEqual': instance.operationTypeEqual,
      'regionContains': instance.regionContains,
      'environmentEqual': instance.environmentEqual,
      'nameContains': instance.nameContains,
    };
