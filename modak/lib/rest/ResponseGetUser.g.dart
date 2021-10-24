// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseGetUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetUser _$ResponseGetUserFromJson(Map<String, dynamic> json) =>
    ResponseGetUser(
      content: (json['content'] as List<dynamic>)
          .map((e) => GetUserContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseGetUserToJson(ResponseGetUser instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

GetUserContent _$GetUserContentFromJson(Map<String, dynamic> json) =>
    GetUserContent(
      id: json['id'] as int,
      email: json['email'] as String,
      goods: (json['goods'] as List<dynamic>)
          .map((e) => Good.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUserContentToJson(GetUserContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'goods': instance.goods,
    };

Good _$GoodFromJson(Map<String, dynamic> json) => Good(
      id: json['id'] as int,
      camping: Content.fromJson(json['camping'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoodToJson(Good instance) => <String, dynamic>{
      'id': instance.id,
      'camping': instance.camping,
    };
