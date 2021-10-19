// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chat _$_$_ChatFromJson(Map<String, dynamic> json) {
  return _$_Chat(
    userId: json['userId'] as String,
    matchingId: json['matchingId'] as String,
    message: json['message'] as String,
    createDate: DateTime.parse(json['createDate'] as String),
  );
}

Map<String, dynamic> _$_$_ChatToJson(_$_Chat instance) => <String, dynamic>{
      'userId': instance.userId,
      'matchingId': instance.matchingId,
      'message': instance.message,
      'createDate': instance.createDate.toIso8601String(),
    };
