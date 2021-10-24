// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseGetCampings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetCampings _$ResponseGetCampingsFromJson(Map<String, dynamic> json) {
  return ResponseGetCampings(
    content: (json['content'] as List<dynamic>)
        .map((e) => Content.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResponseGetCampingsToJson(
        ResponseGetCampings instance) =>
    <String, dynamic>{
      'content': instance.content,
    };
