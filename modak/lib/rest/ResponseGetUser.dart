import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modak/rest/Content.dart';
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
  List<Good> goods;

  GetUserContent({required this.id, required this.email, required this.goods});

  factory GetUserContent.fromJson(Map<String, dynamic> json) => _$GetUserContentFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserContentToJson(this);
}

@JsonSerializable()
class Good {
  int id;
  Content camping;

  Good({required this.id, required this.camping});

  factory Good.fromJson(Map<String, dynamic> json) => _$GoodFromJson(json);

  Map<String, dynamic> toJson() => _$GoodToJson(this);
}
