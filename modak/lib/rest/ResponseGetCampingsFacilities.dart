import 'package:freezed_annotation/freezed_annotation.dart';

part 'ResponseGetCampingsFacilities.g.dart';

@JsonSerializable()
class ResponseGetCampingsFacilities {
  List<String> data;

  ResponseGetCampingsFacilities({required this.data});

  factory ResponseGetCampingsFacilities.fromJson(Map<String, dynamic> json) => _$ResponseGetCampingsFacilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseGetCampingsFacilitiesToJson(this);
}