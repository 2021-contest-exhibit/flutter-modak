// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModakUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ModakUser _$_$_ModakUserFromJson(Map<String, dynamic> json) {
  return _$_ModakUser(
    uid: json['uid'] as String,
    email: json['email'] as String,
    image: json['image'] as String,
    level: json['level'] as int,
  );
}

Map<String, dynamic> _$_$_ModakUserToJson(_$_ModakUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'image': instance.image,
      'level': instance.level,
    };
