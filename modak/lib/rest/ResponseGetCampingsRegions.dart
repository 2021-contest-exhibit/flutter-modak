import 'package:freezed_annotation/freezed_annotation.dart';

part 'ResponseGetCampingsRegions.g.dart';

@JsonSerializable()
class ResponseGetCampingsRegions {
  List<String> data;


  ResponseGetCampingsRegions({required this.data});

  factory ResponseGetCampingsRegions.fromJson(Map<String, dynamic> json) => _$ResponseGetCampingsRegionsFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseGetCampingsRegionsToJson(this);
}

