// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseGetCampings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetCampings _$ResponseGetCampingsFromJson(Map<String, dynamic> json) {
  return ResponseGetCampings(
    content: (json['content'] as List<dynamic>)
        .map((e) => Content.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResponseGetCampingsToJson(
        ResponseGetCampings instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

Content _$ContentFromJson(Map<String, dynamic> json) {
  return Content(
    contentId: json['contentId'] as int,
    name: json['name'] as String?,
    viewCount: json['viewCount'] as int?,
    addr: json['addr'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    type: json['type'] as String?,
    operationSeasons: json['operationSeasons'] as String?,
    operationDays: json['operationDays'] as String?,
    reservationWay: json['reservationWay'] as String?,
    nearbyFacilitiesAvailable: json['nearbyFacilitiesAvailable'] as String?,
    facilities: json['facilities'] as String?,
    longitude: json['longitude'] as String?,
    latitude: json['latitude'] as String?,
    operationType: json['operationType'] as String?,
    shortDescription: json['shortDescription'] as String?,
    longDescription: json['longDescription'] as String?,
    environments: (json['environments'] as List<dynamic>?)
        ?.map((e) => Environment.fromJson(e as Map<String, dynamic>))
        .toList(),
    campingImages: (json['campingImages'] as List<dynamic>?)
        ?.map((e) => CampingImage.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'contentId': instance.contentId,
      'name': instance.name,
      'viewCount': instance.viewCount,
      'addr': instance.addr,
      'phoneNumber': instance.phoneNumber,
      'type': instance.type,
      'operationSeasons': instance.operationSeasons,
      'operationDays': instance.operationDays,
      'reservationWay': instance.reservationWay,
      'nearbyFacilitiesAvailable': instance.nearbyFacilitiesAvailable,
      'facilities': instance.facilities,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'operationType': instance.operationType,
      'shortDescription': instance.shortDescription,
      'longDescription': instance.longDescription,
      'environments': instance.environments,
      'campingImages': instance.campingImages,
    };

Environment _$EnvironmentFromJson(Map<String, dynamic> json) {
  return Environment(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$EnvironmentToJson(Environment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CampingImage _$CampingImageFromJson(Map<String, dynamic> json) {
  return CampingImage(
    id: json['id'] as int,
    serialnum: json['serialnum'] as String,
    modifiedtime: json['modifiedtime'] as String,
    imageUrl: json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$CampingImageToJson(CampingImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serialnum': instance.serialnum,
      'modifiedtime': instance.modifiedtime,
      'imageUrl': instance.imageUrl,
    };
