import 'package:freezed_annotation/freezed_annotation.dart';

part 'RequestDeleteGood.g.dart';

@JsonSerializable()
class RequestDeleteGood {
  int contentId;
  String email;

  RequestDeleteGood({required this.contentId, required this.email});

  factory RequestDeleteGood.fromJson(Map<String, dynamic> json) => _$RequestDeleteGoodFromJson(json);

  Map<String, dynamic> toJson() => _$RequestDeleteGoodToJson(this);
}