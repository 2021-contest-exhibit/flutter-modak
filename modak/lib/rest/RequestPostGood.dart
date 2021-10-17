import 'package:freezed_annotation/freezed_annotation.dart';

part 'RequestPostGood.g.dart';

@JsonSerializable()
class RequestPostGood {
  int contentId;
  String email;

  RequestPostGood({required this.contentId, required this.email});

  factory RequestPostGood.fromJson(Map<String, dynamic> json) => _$RequestPostGoodFromJson(json);

  Map<String, dynamic> toJson() => _$RequestPostGoodToJson(this);
}