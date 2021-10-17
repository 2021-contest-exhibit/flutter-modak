import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modak/rest/ResponseGetCampings.dart';

part 'ResponseGetUser.g.dart';

@JsonSerializable()
class ResponseGetUser {
  List<GetUserContent> content;

  ResponseGetUser({required this.content});

  factory ResponseGetUser.fromJson(Map<String, dynamic> json) => _$ResponseGetUserFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseGetUserToJson(this);
}

@JsonSerializable()
class GetUserContent {
  int id;
  String email;
  List<Content> goods;

  GetUserContent({required this.id, required this.email, required this.goods});

  factory GetUserContent.fromJson(Map<String, dynamic> json) => _$GetUserContentFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserContentToJson(this);
}
