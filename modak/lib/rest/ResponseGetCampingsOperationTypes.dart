import 'package:freezed_annotation/freezed_annotation.dart';

part 'ResponseGetCampingsOperationTypes.g.dart';

@JsonSerializable()
class ResponseGetCampingsOperationTypes {
  List<String> data;


  ResponseGetCampingsOperationTypes({required this.data});

  factory ResponseGetCampingsOperationTypes.fromJson(Map<String, dynamic> json) => _$ResponseGetCampingsOperationTypesFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseGetCampingsOperationTypesToJson(this);
}