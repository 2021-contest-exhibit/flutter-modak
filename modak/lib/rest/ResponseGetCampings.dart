import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modak/rest/Content.dart';

part 'ResponseGetCampings.g.dart';

@JsonSerializable()
class ResponseGetCampings {
  List<Content> content;

  ResponseGetCampings({required this.content});

  factory ResponseGetCampings.fromJson(Map<String, dynamic> json) => _$ResponseGetCampingsFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseGetCampingsToJson(this);
}
