import 'package:freezed_annotation/freezed_annotation.dart';

part 'FindCampingsRequestDto.g.dart';

@JsonSerializable()
class FindCampingsRequestDto {
  List<String> operationTypeEqual;
  List<String> regionContains;
  List<String> environmentEqual;
  String nameContains;

  FindCampingsRequestDto({required this.operationTypeEqual, required this.regionContains, required this.environmentEqual, required this.nameContains});

  factory FindCampingsRequestDto.fromJson(Map<String, dynamic> json) => _$FindCampingsRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FindCampingsRequestDtoToJson(this);
}