import 'package:freezed_annotation/freezed_annotation.dart';

part 'ResponseGetCampingsEnvironments.g.dart';

@JsonSerializable()
class ResponseGetCampingsEnvironments {
  List<String> data;

  ResponseGetCampingsEnvironments({required this.data});

  factory ResponseGetCampingsEnvironments.fromJson(Map<String, dynamic> json) => _$ResponseGetCampingsEnvironmentsFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseGetCampingsEnvironmentsToJson(this);
}