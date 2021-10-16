import 'package:freezed_annotation/freezed_annotation.dart';

part 'RequestPostUser.g.dart';

@JsonSerializable()
class RequestPostUser {
  String email;

  RequestPostUser({required this.email});

  factory RequestPostUser.fromJson(Map<String, dynamic> json) => _$RequestPostUserFromJson(json);

  Map<String, dynamic> toJson() => _$RequestPostUserToJson(this);
}